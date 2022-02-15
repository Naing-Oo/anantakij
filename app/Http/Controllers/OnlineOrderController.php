<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Customer;
use App\Models\CustomerGroup;
use App\Models\Warehouse;
use App\Models\Biller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Unit;
use App\Models\Tax;
use App\Models\Sale;
use App\Models\Delivery;
use App\Models\PosSetting;
use App\Models\Product_Sale;
use App\Models\Product_Warehouse;
use App\Models\Payment;
use App\Models\Account;
use App\Models\Coupon;
use App\Models\GiftCard;
use App\Models\PaymentWithCheque;
use App\Models\PaymentWithGiftCard;
use App\Models\PaymentWithCreditCard;
use App\Models\PaymentWithPaypal;
use App\Models\User;
use App\Models\Variant;
use App\Models\ProductVariant;
use App\Models\CashRegister;
use App\Models\Returns;
use App\Models\Expense;
use App\Models\ProductPurchase;
use App\Models\ProductBatch;
use App\Models\Purchase;
use App\Models\RewardPointSetting;
use DB;
use App\GeneralSetting;
use Stripe\Stripe;
use NumberToWords\NumberToWords;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\UserNotification;
use Illuminate\Support\Facades\Mail;
use Srmklive\PayPal\Services\ExpressCheckout;
use Srmklive\PayPal\Services\AdaptivePayments;
use GeniusTS\HijriDate\Date;
use Illuminate\Support\Facades\Validator;

class OnlineOrderController extends Controller
{
    public function index(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);

        if($role->hasPermissionTo('sales-index')) {
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            
            if($request->input('starting_date')) {
                $starting_date = $request->input('starting_date');
                $ending_date = $request->input('ending_date');
            }
            else {
                $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d') )))));
                $ending_date = date("Y-m-d");
            }

            $account_list = Account::where('is_active', true)->get();

            return view('order.index',compact('starting_date', 'ending_date', 'account_list', 'all_permission'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    // Select Data
    public function saleData(Request $request)
    {
        
        $columns = array( 
            1 => 'created_at', 
            2 => 'reference_no',
            7 => 'grand_total',
            8 => 'paid_amount',
        );
        
        $totalData = Sale::where('user_id', Auth::id())
                    ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                    ->whereDate('created_at', '<=' ,$request->input('ending_date'))
                    ->count();
        

        $totalFiltered = $totalData;
        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'sales.'.$columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        if(empty($request->input('search.value'))) {  // without search value

            $sales = Sale::with('biller', 'customer', 'warehouse', 'user')
                    ->where('user_id', Auth::id()) // search by user id
                    ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                    ->whereDate('created_at', '<=' ,$request->input('ending_date'))
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order, $dir)
                    ->get();
        }
        else
        {
            $search = $request->input('search.value'); // with search value
           
                $sales =  Sale::select('sales.*')
                            ->with('biller', 'customer', 'warehouse', 'user')
                            ->join('customers', 'sales.customer_id', '=', 'customers.id')
                            ->join('billers', 'sales.biller_id', '=', 'billers.id')
                            ->whereDate('sales.created_at', '=' , date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                            ->where('sales.user_id', Auth::id())
                            ->orwhere([
                                ['sales.reference_no', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['customers.name', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['customers.phone_number', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['billers.name', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->offset($start)
                            ->limit($limit)
                            ->orderBy($order,$dir)->get();

                $totalFiltered = Sale::
                            join('customers', 'sales.customer_id', '=', 'customers.id')
                            ->join('billers', 'sales.biller_id', '=', 'billers.id')
                            ->whereDate('sales.created_at', '=' , date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                            ->where('sales.user_id', Auth::id())
                            ->orwhere([
                                ['sales.reference_no', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['customers.name', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['customers.phone_number', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->orwhere([
                                ['billers.name', 'LIKE', "%{$search}%"],
                                ['sales.user_id', Auth::id()]
                            ])
                            ->count();
           
        }

        $data = array();
        if(!empty($sales))
        {
            foreach ($sales as $key=>$sale)
            {
                $nestedData['id'] = $sale->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($sale->created_at->toDateString()));
                $nestedData['reference_no'] = $sale->reference_no;
                $nestedData['biller'] = $sale->biller->name;
                $nestedData['customer'] = $sale->customer->name.'<input type="hidden" class="deposit" value="'.($sale->customer->deposit - $sale->customer->expense).'" />'.'<input type="hidden" class="points" value="'.$sale->customer->points.'" />';

                // sale status
                if($sale->sale_status == 1){
                    $nestedData['sale_status'] = '<div class="badge badge-success">'.trans('file.Completed').'</div>';
                    $sale_status = trans('file.Completed');
                }
                elseif($sale->sale_status == 2){
                    $nestedData['sale_status'] = '<div class="badge badge-danger">'.trans('file.Pending').'</div>';
                    $sale_status = trans('file.Pending');
                }
                else{
                    $nestedData['sale_status'] = '<div class="badge badge-warning">'.trans('file.Draft').'</div>';
                    $sale_status = trans('file.Draft');
                }

                // payment status
                if($sale->payment_status == 1)
                    $nestedData['payment_status'] = '<div class="badge badge-danger">'.trans('file.Pending').'</div>';
                elseif($sale->payment_status == 2)
                    $nestedData['payment_status'] = '<div class="badge badge-danger">'.trans('file.Due').'</div>';
                elseif($sale->payment_status == 3)
                    $nestedData['payment_status'] = '<div class="badge badge-warning">'.trans('file.Partial').'</div>';
                else
                    $nestedData['payment_status'] = '<div class="badge badge-success">'.trans('file.Paid').'</div>';

                $nestedData['grand_total'] = number_format($sale->grand_total, 2);
                $nestedData['paid_amount'] = number_format($sale->paid_amount, 2);
                $nestedData['due'] = number_format($sale->grand_total - $sale->paid_amount, 2);

                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li><a href="'.route('order.invoice', $sale->id).'" class="btn btn-link"><i class="fa fa-copy"></i> '.trans('file.Generate Invoice').'</a></li>
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> '.trans('file.View').'</button>
                                </li>';

                if(in_array("sales-edit", $request['all_permission'])){
                    if($sale->sale_status != 3)
                        $nestedData['options'] .= '<li>
                            <a href="'.route('orders.edit', $sale->id).'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans('file.edit').'</a>
                            </li>';
                    else
                        $nestedData['options'] .= '<li>
                            <a href="'.url('orders/'.$sale->id.'/create').'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans('file.edit').'</a>
                        </li>';
                }
                
                $nestedData['sale'] = array( '[ "'.date(config('date_format'), strtotime($sale->created_at->toDateString())).'"', ' "'.$sale->reference_no.'"', ' "'.$sale_status.'"', 
                                            ' "'.$sale->customer->name.'"', ' "'.$sale->customer->phone_number.'"', 
                                            ' "'.$sale->customer->address.'"', ' "'.$sale->customer->city.'"', ' "'.$sale->id.'"', ' "'.$sale->total_tax.'"', 
                                            ' "'.$sale->total_price.'"', ' "'.$sale->order_tax.'"', ' "'.$sale->order_tax_rate.'"', ' "'.$sale->order_discount.'"',
                                            ' "'.$sale->grand_total.'"', ' "'.$sale->paid_amount.'"', ' "'.preg_replace('/[\n\r]/', "<br>", $sale->sale_note).'"', 
                                            ' "'.preg_replace('/[\n\r]/', "<br>", $sale->staff_note).'"', ' "'.$sale->user->name.'"', ' "'.$sale->user->email.'"]'
                );
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),  
            "recordsTotal"    => intval($totalData),  
            "recordsFiltered" => intval($totalFiltered), 
            "data"            => $data   
        );
            
        echo json_encode($json_data);
    }

    public function productSaleData($id)
    {
        return 'roduct sale data';
        $product_sale_data = Product_Sale::where('sale_id', $id)->get();

        foreach ($product_sale_data as $key => $product_sale_data) {

            $product = Product::find($product_sale_data->product_id);

            // if($product_sale_data->variant_id) {
            //     $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
            //     $product->code = $lims_product_variant_data->item_code;
            // }
            $unit_data = Unit::find($product_sale_data->sale_unit_id);
            if($unit_data){
                $unit = $unit_data->unit_code;
            }
            else
                $unit = '';

            if($product_sale_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_sale_data->product_batch_id);
                $product_sale[7][$key] = $product_batch_data->batch_no;
            }
            else
                $product_sale[7][$key] = 'N/A';
                $product_sale[0][$key] = $product->name . ' [' . $product->code . ']';
                if($product_sale_data->imei_number)
                    $product_sale[0][$key] .= '<br>IMEI or Serial Number: '. $product_sale_data->imei_number;
                $product_sale[1][$key] = $product_sale_data->qty;
                $product_sale[2][$key] = $unit;
                $product_sale[3][$key] = $product_sale_data->tax;
                $product_sale[4][$key] = $product_sale_data->tax_rate;
                $product_sale[5][$key] = $product_sale_data->discount;
                $product_sale[6][$key] = $product_sale_data->total;
        }
        return $product_sale;
    }

}
