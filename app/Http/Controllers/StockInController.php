<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\StockIn;
use App\Models\ProductStockIn;
use App\Models\Purchase;
use App\Models\ProductPurchase;
use App\Models\Warehouse;
use App\Models\Product_Warehouse;
use App\Models\ProductBatch;
use App\Models\Unit;
use App\Models\Tax;
use Auth;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Validator;

class StockInController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('transfers-index')){ // need to add permission for stock in
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            
            if(Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $stockIns = StockIn::with('fromWarehouse', 'toWarehouse', 'user', 'purchase', 'supplier')->orderBy('id', 'desc')->where('user_id', Auth::id())->get();
            else
                $stockIns = StockIn::with('fromWarehouse', 'toWarehouse', 'user', 'purchase', 'supplier')->orderBy('id', 'desc')->get();
            
            return view('stockin.index', compact('stockIns', 'all_permission'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('transfers-add')){ // need to add role for stock in

            $purchase_ref_numbers = ProductPurchase::select('purchases.id','purchases.reference_no')
                                    ->join('purchases', 'purchases.id', 'product_purchases.purchase_id')
                                    ->where('remaining_qty', '>', 0)
                                    ->groupBy('purchases.reference_no', 'purchases.id')
                                    ->get(); 
            
            $from_warehouses = ProductPurchase::select('warehouses.id','warehouses.name')
                                    ->join('purchases', 'purchases.id', 'product_purchases.purchase_id')
                                    ->join('warehouses', 'warehouses.id', 'purchases.warehouse_id')
                                    ->where('remaining_qty', '>', 0)
                                    ->groupBy('warehouses.name', 'warehouses.id')
                                    ->get(); 

            $lims_warehouse_list = Warehouse::where([
                                                ['is_active', true],
                                                ['warehouse_type', '<>', 'temp']
                                            ])->get();
                                            
            $products = $this->productWithoutVariant();

            return view('stockin.create', compact('lims_warehouse_list', 'from_warehouses', 'purchase_ref_numbers', 'products'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function productWithoutVariant()
    {
        return Product::ActiveStandard()->select('id', 'name', 'code')
                ->whereNull('is_variant')
                ->get();
    }

    public function productSearch(Request $request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $product_variant_id = null;

        $product_data = Product::where([
                            ['code', $product_code[0]],
                            ['is_active', true]
                        ])->first();

        if(!$product_data) {
            $product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code')
                ->where('product_variants.item_code', $product_code[0])
                ->first();

            $product_variant_id = $product_data->product_variant_id;
            $product_data->code = $product_data->item_code;
        }
        $product[] = $product_data->name;  // 0
        $product[] = $product_data->code;  // 1
        $product[] = $product_data->cost; // 2

        // product text
        if ($product_data->tax_id) {
            $lims_tax_data = Tax::find($product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;  // 3
            $product[] = 'No Tax'; // 4
        }
        $product[] = $product_data->tax_method; // 5

        // product unit
        $units = Unit::where("base_unit", $product_data->unit_id)
                    ->orWhere('id', $product_data->unit_id)
                    ->get();
        // return $units;
        $unit_name = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_name, $unit->unit_name);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_name[]  = $unit->unit_name;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }
        
        $product[] = implode(",", $unit_name) . ',';  // 6
        $product[] = implode(",", $unit_operator) . ',';  // 7
        $product[] = implode(",", $unit_operation_value) . ',';  // 8
        $product[] = $product_data->id; // 9
        $product[] = $product_variant_id;  // 10
        $product[] = $product_data->is_batch;  // 11
        $product[] = $product_data->is_imei;  // 12
        return $product;
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();
        $data['reference_no'] = 'IN-' . date("Ymd") . '-'. date("his");  
        $data['status'] = '1';

        $product_purchase = ProductPurchase::where('purchase_id', $data['purchase_id'])->get();
        
        // update remaining qty to purchase
        if ($product_purchase){
            foreach ($product_purchase as $key => $value) {
                
                $product_warehouse_data = Product_Warehouse::where([
                                            ['product_id', $product_purchase[$key]->product_id],
                                            ['warehouse_id', $data['from_warehouse_id_hidden'] ],
                                        ])->first();

                $product_data = Product::where('id', $product_purchase[$key]->product_id)
                                        ->first();
                
                $product_data->qty -= $product_purchase[$key]->remaining_qty;                    
                $product_warehouse_data->qty = $product_warehouse_data->qty - $product_purchase[$key]->remaining_qty;
                $product_purchase[$key]->remaining_qty = 0;
                $product_data->save();
                $product_warehouse_data->save();
                $product_purchase[$key]->save();
                    
            }
        }

        $stock_in_data = StockIn::create($data);

        $product_id = $data['product_id'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $total = $data['total_kg'];
        $product_stockIn = [];

        foreach ($product_id as $i => $id) {
            $purchase_unit_data  = Unit::where('unit_name', $purchase_unit[$i])->first();

            if ($purchase_unit_data->operator == '*')
                    $quantity = $qty[$i] * $purchase_unit_data->operation_value;
                else 
                    $quantity = $qty[$i] / $purchase_unit_data->operation_value;
            $product_data = Product::find($id);

            //dealing with product barch
            if($product_batch_id[$i]) {
                $product_batch_data = ProductBatch::where([
                                        ['product_id', $product_data->id],
                                        ['batch_no', $product_batch_id[$i]]
                                    ])->first();
                if($product_batch_data) {
                    $product_batch_data->expired_date = $expired_date[$i];
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                }
                else {
                    $product_batch_data = ProductBatch::create([
                                            'product_id' => $product_data->id,
                                            'batch_no' => $product_batch_id[$i],
                                            'expired_date' => $expired_date[$i],
                                            'qty' => $quantity
                                        ]);   
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            }
            else
                $product_purchase['product_batch_id'] = null;

            if($product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($product_data->id, $product_code[$i])->first();
                $product_warehouse_data = Product_Warehouse::where([
                    ['product_id', $id],
                    ['variant_id', $lims_product_variant_data->variant_id],
                    ['warehouse_id', $data['to_warehouse_id']]
                ])->first();
                $product_purchase['variant_id'] = $lims_product_variant_data->variant_id;
                //add quantity to product variant table
                $lims_product_variant_data->qty += $quantity;
                $lims_product_variant_data->save();
            }
            else {
                $product_purchase['variant_id'] = null;
                if($product_purchase['product_batch_id']) {
                    $product_warehouse_data = Product_Warehouse::where([
                        ['product_id', $id],
                        ['product_batch_id', $product_purchase['product_batch_id'] ],
                        ['warehouse_id', $data['to_warehouse_id'] ],
                    ])->first();
                }
                else {
                    $product_warehouse_data = Product_Warehouse::where([
                        ['product_id', $id],
                        ['warehouse_id', $data['to_warehouse_id'] ],
                    ])->first();
                }
            }

            //add quantity to product table
            // need to discuss $quantity
            $product_data->qty = $product_data->qty + $quantity;
            $product_data->save();
            //add quantity to warehouse
            if ($product_warehouse_data) {
                $product_warehouse_data->qty = $product_warehouse_data->qty + $quantity;
            } 
            else {
                $product_warehouse_data = new Product_Warehouse();
                $product_warehouse_data->product_id = $id;
                $product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                $product_warehouse_data->warehouse_id = $data['to_warehouse_id'];
                $product_warehouse_data->qty = $quantity;
                if($product_data->is_variant)
                    $product_warehouse_data->variant_id = $lims_product_variant_data->variant_id;
            }            
            $product_warehouse_data->save();
                
            $product_stockIn['stockin_id'] = $stock_in_data->id ;
            $product_stockIn['product_id'] = $product_id[$i];
            $product_stockIn['product_batch_id'] = $product_batch_id[$i];
            $product_stockIn['qty'] = $qty[$i];
            $product_stockIn['unit_id'] = $purchase_unit_data->id;
            $product_stockIn['total'] = $total[$i];
             ProductStockIn::create($product_stockIn);
        }

        return redirect('stock-in')->with('message', 'Transfer to warehouse successfully');
    }

    public function productStockInData($id)
    {
        $lims_product_stockin_data = ProductStockIn::where('stockin_id', $id)->get();

        foreach ($lims_product_stockin_data as $key => $product_stockin_data) {

            $product = Product::find($product_stockin_data->product_id);
            $unit = Unit::find($product_stockin_data->unit_id);
            
            $product_stockin[0][$key] = $product->name . ' [' . $product->code. ']';
            if($product_stockin_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_stockin_data->product_batch_id);
                $product_stockin[1][$key] = $product_batch_data->batch_no;
            }
            else
                $product_stockin[1][$key] = 'N/A';

            $product_stockin[2][$key] = $product_stockin_data->qty;
            $product_stockin[3][$key] = $unit->unit_name;
            $product_stockin[4][$key] = $product_stockin_data->total;
        }
        return $product_stockin;
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('transfers-edit')){
            
            $stockIn = StockIn::find($id);
            $product_stockIns = ProductStockIn::where('stockin_id', $id)->get();

            $old_purchase_number = StockIn::select('purchases.id','purchases.reference_no')
                                            ->join('purchases', 'purchases.id', 'stock_in.purchase_id')
                                            ->where('stock_in.id', $id);
            $purchase_ref_numbers = ProductPurchase::select('purchases.id','purchases.reference_no')
                                            ->join('purchases', 'purchases.id', 'product_purchases.purchase_id')
                                            ->where('remaining_qty', '>', 0)
                                            ->groupBy('purchases.reference_no', 'purchases.id')
                                            ->unionAll($old_purchase_number)
                                            ->get(); 

            $old_from_warehouse = StockIn::select('warehouses.id','warehouses.name')
                                            ->join('warehouses', 'warehouses.id', 'stock_in.from_warehouse_id')
                                            ->where('stock_in.id', $id);
            $from_warehouses = ProductPurchase::select('warehouses.id','warehouses.name')
                                                ->join('purchases', 'purchases.id', 'product_purchases.purchase_id')
                                                ->join('warehouses', 'warehouses.id', 'purchases.warehouse_id')
                                                ->where('remaining_qty', '>', 0)
                                                ->groupBy('warehouses.name', 'warehouses.id')
                                                ->union($old_from_warehouse)
                                                ->get(); 

            $lims_warehouse_list = Warehouse::where([
                                                ['is_active', true],
                                                ['warehouse_type', '<>', 'temp']
                                            ])->get();
                                            
            $products = $this->productWithoutVariant();

            return view('stockin.edit', compact('stockIn', 'product_stockIns', 'lims_warehouse_list', 'products', 'purchase_ref_numbers', 'from_warehouses'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();

        $product_purchase = ProductPurchase::where('purchase_id', $data['purchase_id_hidden'])->get();
        
        // update remaining qty to purchase
        if ($product_purchase){
            foreach ($product_purchase as $key => $value) {
                
                $product_warehouse_data = Product_Warehouse::where([
                                            ['product_id', $product_purchase[$key]->product_id],
                                            ['warehouse_id', $data['from_warehouse_id_hidden'] ],
                                        ])->first();

                $product_data = Product::where('id', $product_purchase[$key]->product_id)
                                        ->first();
                
                $product_data->qty -= $product_purchase[$key]->remaining_qty;                    
                $product_warehouse_data->qty = $product_warehouse_data->qty - $product_purchase[$key]->remaining_qty;
                $product_purchase[$key]->remaining_qty = 0;
                $product_data->save();
                $product_warehouse_data->save();
                $product_purchase[$key]->save();
                    
            }
        }

        $stock_in_data = StockIn::find($id);
        $product_stockins = ProductStockIn::where('stockin_id', $id)->get();

        $product_id = $data['product_id'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $total = $data['subtotal'];
        $product_stockIn = [];
        $old_product_id = [];


        // remove old qty from product / product warehouse / product batch
        if ($product_stockins) {
            foreach ($product_stockins as $key => $product_stockin) {
                $old_product_id[] = $product_stockin->product_id;
                $product = Product::find($product_stockin->product_id);
                
                $product_warehouse = Product_Warehouse::where([
                                        ['product_id', $product_stockin->product_id],
                                        ['warehouse_id', $data['to_warehouse_id'] ],
                                    ])->first();
    
                $product_batch = ProductBatch::where([
                                    ['product_id', $product_stockin->product_id],
                                    ['batch_no', $product_stockin->product_batch_id]
                                ])->first();
               
                if ($product){
                    $product->qty = $product->qty - $product_stockin->total;
                    $product->save();
                }
    
                if ($product_warehouse){
                    $product_warehouse->qty = $product_warehouse->qty - $product_stockin->total;
                    $product_warehouse->save();
                }
    
                if ($product_batch){
                    $product_batch->qty = $product_batch->qty - $product_stockin->total;
                    $product_batch->save();
                }

                if ( !(in_array($old_product_id[$key], $product_id)) ){
                    $product_stockin->delete();
                }

            }
        } // success
        
        // new update product stock in data
        foreach ($product_id as $i => $pro_id) { // product id from client
            // get unit
            $purchase_unit_data  = Unit::where('unit_name', $purchase_unit[$i])->first();
            if ($purchase_unit_data->operator == '*')
                    $quantity = $qty[$i] * $purchase_unit_data->operation_value;
                else 
                    $quantity = $qty[$i] / $purchase_unit_data->operation_value;
            // get product by update id
            $product_data = Product::find($pro_id);

            // get product batch data
            if($product_batch_id[$i]) {
                $product_batch_data = ProductBatch::where([
                                        ['product_id', $product_data->id],
                                        ['batch_no', $product_batch_id[$i]]
                                    ])->first();
                if($product_batch_data) {
                    $product_batch_data->expired_date = $expired_date[$i];
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();   // check for update
                }
                else {
                    $product_batch_data = ProductBatch::create([
                                            'product_id' => $product_data->id,
                                            'batch_no' => $product_batch_id[$i],
                                            'expired_date' => $expired_date[$i],
                                            'qty' => $quantity
                                        ]);   
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            }
            else
                $product_purchase['product_batch_id'] = null;

            // get pruduct warehouse data
            if($product_purchase['product_batch_id']) {
                $product_warehouse_data = Product_Warehouse::where([
                                            ['product_id', $pro_id],
                                            ['product_batch_id', $product_purchase['product_batch_id'] ],
                                            ['warehouse_id', $data['to_warehouse_id'] ],
                                        ])->first();
            }
            else {
                $product_warehouse_data = Product_Warehouse::where([
                                            ['product_id', $pro_id],
                                            ['warehouse_id', $data['to_warehouse_id'] ]
                                        ])->first();
            }


            //update quantity to product table
            $product_data->qty = $product_data->qty + $quantity;
            $product_data->save(); // update qty to product

            //update quantity to warehouse
            if ($product_warehouse_data) {
                $product_warehouse_data->qty = $product_warehouse_data->qty + $quantity;
            } 
            else {
                $product_warehouse_data = new Product_Warehouse();
                $product_warehouse_data->product_id = $pro_id;
                $product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                $product_warehouse_data->warehouse_id = $data['to_warehouse_id'];
                $product_warehouse_data->qty = $quantity;
            }            
            $product_warehouse_data->save(); // update qty to product warehouse
            
            // update to product stockin table
            $product_stockIn['stockin_id'] = $id ;
            $product_stockIn['product_id'] = $product_id[$i];
            $product_stockIn['product_batch_id'] = $product_batch_id[$i];
            $product_stockIn['qty'] = $qty[$i];
            $product_stockIn['unit_id'] = $purchase_unit_data->id;
            $product_stockIn['total'] = $total[$i];

          
            if(in_array($pro_id, $old_product_id) ){
                ProductStockIn::where([
                                ['stockin_id', $id],
                                ['product_id', $pro_id]
                            ])->update($product_stockIn);
            }
            else                
                ProductStockIn::create($product_stockIn);
        }
        $stock_in_data->update($data);

        return redirect('stock-in')->with('message', 'Transfer to warehouse successfully');
    }


    public function deleteBySelection(Request $request)
    {

        return 'not support this feature';

        $transfer_id = $request['transferIdArray'];
        foreach ($transfer_id as $id) {
            $lims_transfer_data =Transfer::find($id);
            $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
            foreach ($lims_product_transfer_data as $product_transfer_data) {
                $lims_transfer_unit_data = Unit::find($product_transfer_data->purchase_unit_id);
                if ($lims_transfer_unit_data->operator == '*') {
                    $quantity = $product_transfer_data->qty * $lims_transfer_unit_data->operation_value;
                } else {
                    $quantity = $product_transfer_data / $lims_transfer_unit_data->operation_value;
                }

                if($lims_transfer_data->status == 1) {
                    //add quantity for from warehouse
                    if($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                    $lims_product_warehouse_data->qty += $quantity;
                    $lims_product_warehouse_data->save();
                    //deduct quantity for to warehouse
                    if($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->to_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->to_warehouse_id)->first();

                    $lims_product_warehouse_data->qty -= $quantity;
                    $lims_product_warehouse_data->save();
                }
                elseif($lims_transfer_data->status == 3) {
                    //add quantity for from warehouse
                    if($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();

                    $lims_product_warehouse_data->qty += $quantity;
                    $lims_product_warehouse_data->save();
                }
                $product_transfer_data->delete();
            }
            $lims_transfer_data->delete();
        }
        return 'Stock In deleted successfully!';
    }


    public function destroy($id)
    {
        $stock_in_data =StockIn::find($id);
        $lims_product_stockin_data = ProductStockIn::where('stockin_id', $id)->get();

        $product_purchase = ProductPurchase::where('purchase_id', $stock_in_data->purchase_id)->get();

        // update remaining qty to purchase
        if ($product_purchase){
            foreach ($product_purchase as $key => $value) {
                
                $product_warehouse_data = Product_Warehouse::where([
                                ['product_id', $product_purchase[$key]->product_id],
                                ['warehouse_id', $stock_in_data->from_warehouse_id ],
                                ])->first();

                $product_data = Product::where('id', $product_purchase[$key]->product_id)
                                        ->first();
                   
                $product_data += $product_purchase[$key]->actual_qty;
                $product_warehouse_data->qty += $product_purchase[$key]->actual_qty;
                $product_purchase[$key]->remaining_qty = $product_purchase[$key]->actual_qty;
                $product_data->save();
                $product_warehouse_data->save();
                $product_purchase[$key]->save();
                    
            }
        }

        foreach ($lims_product_stockin_data as $product_stockin_data) {

            $product = Product::find($product_stockin_data->product_id);
                
            $product_warehouse = Product_Warehouse::where([
                                    ['product_id', $product_stockin_data->product_id],
                                    ['warehouse_id', $stock_in_data['to_warehouse_id'] ],
                                ])->first();

            $product_batch = ProductBatch::where([
                                ['product_id', $product_stockin_data->product_id],
                                ['batch_no', $product_stockin_data->product_batch_id]
                            ])->first();
            
            if ($product){
                $product->qty -= $product_stockin_data->total;
                $product->save();
            }

            if ($product_warehouse){
                $product_warehouse->qty -= $product_stockin_data->total;
                $product_warehouse->save();
            }

            if ($product_batch){
                $product_batch->qty -= $product_stockin_data->total;
                $product_batch->save();
            }

            //deduct quantity for to warehouse
            // if ($product_stockin_data->product_batch_id) {
            //     $lims_product_warehouse_data = Product_Warehouse::where([
            //                                     ['product_batch_id', $product_stockin_data->product_batch_id],
            //                                     ['warehouse_id', $lims_transfer_data->to_warehouse_id]
            //                                 ])->first();
            // }
            // else
            //     $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_stockin_data->product_id, $lims_transfer_data->to_warehouse_id)->first();

            // $lims_product_warehouse_data->qty -= $quantity;
            // $lims_product_warehouse_data->save();
           
            $product_stockin_data->delete();
        }

        $stock_in_data->delete();

        return redirect('stock-in')->with('not_permitted', 'Stock In deleted successfully');
    }


}
