@extends('layouts.main') @section('content')
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<style>
    /*.barcodelist {
        max-width: 378px;
        text-align: center;
    }
    .barcodelist img {
        max-width: 150px;
    }*/

    @media print {
        * {
            font-size:12px;
            line-height: 20px;
        }
        td,th {padding: 5px 0;}
        .hidden-print {
            display: none !important;
        }
        @page { size: landscape; margin: 0 !important; }
        .barcodelist {
            max-width: 378px;
        }
        .barcodelist img {
            max-width: 150px;
        }
    }

</style>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.print_barcode')}}</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>{{trans('file.add_product')}} *</label>
                                        <div class="search-box input-group">

                                            <button type="button" class="btn btn-secondary btn-lg"><i class="fa fa-barcode"></i></button>
                                            <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <div class="table-responsive mt-3">
                                            <table id="myTable" class="table table-hover order-list">
                                                <thead>
                                                    <tr>
                                                        <th>{{trans('file.name')}}</th>
                                                        <th>{{trans('file.Code')}}</th>
                                                        <th>{{trans('file.Quantity')}}</th>
                                                        <th><i class="dripicons-trash"></i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6 mt-2">
                                        <strong>{{trans('file.Print')}}: </strong>&nbsp;
                                        <strong><input type="checkbox" name="name" checked /> {{trans('file.Product Name')}}</strong>&nbsp;
                                        <strong><input type="checkbox" name="price" checked/> {{trans('file.Price')}}</strong>&nbsp;
                                        <strong><input type="checkbox" name="promo_price"/> {{trans('file.Promotional Price')}}</strong>
                                        <strong><input type="checkbox" name="company_name" checked /> {{trans('file.Company Name')}}</strong>
                                        <strong><input type="checkbox" name="is_delivery_date" /> {{trans('file.Delivery Date')}}</strong>
                                    </div>
                                    <div id="delivery_date" class="form-group col-md-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="dripicons-calendar"></i></div>
                                            </div>
                                            <input type="text" name="delivery_date" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label><strong>{{ trans('file.Paper Size') }} *</strong></label>
                                        <select class="form-control" name="paper_size" required id="paper-size">
                                            <option value="0">Select paper size...</option>
                                            <option value="36">36 mm (1.4 inch)</option>
                                            <option value="24">24 mm (0.94 inch)</option>
                                            <option value="18">18 mm (0.7 inch)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary" id="submit-button">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="print-barcode" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                  <h5 id="modal_header" class="modal-title">{{trans('file.Barcode')}}</h5>&nbsp;&nbsp;
                  <button id="print-btn" type="button" class="btn btn-default btn-sm"><i class="dripicons-print"></i> {{trans('file.Print')}}</button>
                  <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <div id="label-content">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script type="text/javascript">

    $("#delivery_date").hide();

    var delivery_date = $('input[name="delivery_date"]');
    delivery_date.datepicker({
    format: "dd-mm-yyyy",
    startDate: "<?php echo date('d-m-Y'); ?>",
    autoclose: true,
    todayHighlight: true
    });

    $('input[name="is_delivery_date"]').on("change", function(e){
        if($(e.currentTarget).is(":checked")){
            $('input[name="delivery_date"]').val($.datepicker.formatDate('dd-mm-yy', new Date()));
            $("#delivery_date").show(300);
        }else{
            $("#delivery_date").hide(300);
        }
    });

    $("ul#product").siblings('a').attr('aria-expanded','true');
    $("ul#product").addClass("show");
    $("ul#product #printBarcode-menu").addClass("active");
    <?php $productArray = []; ?>
    var lims_product_code = [
    @foreach($lims_product_list_without_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->code . ' (' . $product->name . ')');
        ?>
    @endforeach
    @foreach($lims_product_list_with_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->item_code . ' (' . $product->name . ')');
        ?>
    @endforeach
    <?php
        echo  '"'.implode('","', $productArray).'"';
    ?>
    ];

    var lims_productcodeSearch = $('#lims_productcodeSearch');

    lims_productcodeSearch.autocomplete({
    source: function(request, response) {
        var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
        response($.grep(lims_product_code, function(item) {
            return matcher.test(item);
        }));
    },
    select: function(event, ui) {
        var data = ui.item.value;
        $.ajax({
            type: 'GET',
            url: 'lims_product_search',
            data: {
                data: data
            },
            success: function(data) {
                var flag = 1;
                $(".product-code").each(function() {
                    if ($(this).text() == data[1]) {
                        alert('duplicate input is not allowed!')
                        flag = 0;
                    }
                });
                $("input[name='product_code_name']").val('');
                if(flag){
                    var newRow = $('<tr data-imagedata="'+data[3]+'" data-price="'+data[2]+'" data-promo-price="'+data[4]+'" data-company-name="'+data[10]+'" data-currency="'+data[5]+'" data-currency-position="'+data[6]+'">');
                    var cols = '';
                    cols += '<td>' + data[0] + '</td>';
                    cols += '<td class="product-code">' + data[1] + '</td>';
                    cols += '<td><input type="number" class="form-control qty" name="qty[]" value="1" /></td>';
                    cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger">Delete</button></td>';

                    newRow.append(cols);
                    $("table.order-list tbody").append(newRow);
                }
                
            }
        });
    }
});

    //Delete product
    $("table.order-list tbody").on("click", ".ibtnDel", function(event) {
        rowindex = $(this).closest('tr').index();
        $(this).closest("tr").remove();
    });

   
    $("#submit-button").on("click", function(event) {
        paper_size = ($("#paper-size").val());
        if(paper_size != "0") {
            var product_name = [];
            var code = [];
            var price = [];
            var promo_price = [];
            var company_name = [];
            var delivery_date = [];
            var qty = [];
            var barcode_image = [];
            var currency = [];
            var currency_position = [];
            var rownumber = $('table.order-list tbody tr:last').index();
            for(i = 0; i <= rownumber; i++){
                product_name.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('td:nth-child(1)').text());
                code.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('td:nth-child(2)').text());
                price.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('price'));
                promo_price.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('promo-price'));
                company_name.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('company-name'));
                delivery_date.push($('input[name="delivery_date"]').val());
                currency.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('currency'));
                currency_position.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('currency-position'));
                qty.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('.qty').val());
                barcode_image.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('imagedata'));
            }
            var htmltext = '<table class="barcodelist" style="width:378px;" cellpadding="5px" cellspacing="10px">';
            /*$.each(qty, function(index){
                i = 0;
                while(i < qty[index]){
                    if(i % 2 == 0)
                        htmltext +='<tr>';
                    htmltext +='<td style="width:164px;height:88%;padding-top:7px;vertical-align:middle;text-align:center">';
                    htmltext += product_name[index] + '<br>';
                    htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';
                    htmltext += '<strong>'+code[index]+'</strong><br>';
                    htmltext += 'price: '+price[index];
                    htmltext +='</td>';
                    if(i % 2 != 0)
                        htmltext +='</tr>';
                    i++;
                }
            });*/
            $.each(qty, function(index){
                i = 0;
                while(i < qty[index]) {
                    if(i % 2 == 0)
                        htmltext +='<tr>';
                    // 36mm
                    if(paper_size == 36)
                        htmltext +='<td style="width:164px;height:88%;padding-top:7px;vertical-align:middle;text-align:center">';
                    //24mm
                    else if(paper_size == 24)
                        htmltext +='<td style="width:164px;height:100%;font-size:12px;text-align:center">';
                    //18mm
                    else if(paper_size == 18)
                        htmltext +='<td style="width:164px;height:100%;font-size:10px;text-align:center">';

                    if($('input[name="name"]').is(":checked"))
                        htmltext += product_name[index] + '<br>';

                    if(paper_size == 18)
                        htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';
                    else
                        htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';

                    htmltext += code[index] + '<br>';

                    if($('input[name="code"]').is(":checked"))
                        htmltext += '<strong>'+code[index]+'</strong><br>';

                    if($('input[name="promo_price"]').is(":checked")) {
                        if(currency_position[index] == 'prefix')
                            htmltext += '{{ trans('file.Price')}}: '+currency[index]+'<span style="text-decoration: line-through;"> '+price[index]+'</span> '+promo_price[index]+'<br>';
                        else
                            htmltext += '{{ trans('file.Price')}}: <span style="text-decoration: line-through;">'+price[index]+'</span> '+promo_price[index]+' '+currency[index]+'<br>';
                    }
                    else if($('input[name="price"]').is(":checked")) {
                        if(currency_position[index] == 'prefix')
                            htmltext += '{{ trans('file.Price')}}: '+currency[index]+' '+price[index]+'<br>';
                        else
                            htmltext += '{{ trans('file.Price')}}: '+price[index]+' '+currency[index]+'<br>';
                    }

                    if($('input[name="company_name"]').is(":checked")) {
                        htmltext += '{{ trans('file.Company Name')}}: '+company_name[index]+'<br>';
                    }

                    if($('input[name="is_delivery_date"]').is(":checked")) {
                        htmltext += '{{ trans('file.Delivery Date')}}: '+delivery_date[index];
                    }

                    htmltext +='</td>';
                    if(i % 2 != 0)
                        htmltext +='</tr>';
                    i++;
                }
            });
            htmltext += '</table">';
            $('#label-content').html(htmltext);
            $('#print-barcode').modal('show');
        }
        else
            alert("{{ trans('file.Please select paper size') }}");
    });

    /*$("#print-btn").on("click", function(){
          var divToPrint=document.getElementById('print-barcode');
          var newWin=window.open('','Print-Window');
          newWin.document.open();
          newWin.document.write('<style type="text/css">@media print { #modal_header { display: none } #print-btn { display: none } #close-btn { display: none } } table.barcodelist { page-break-inside:auto } table.barcodelist tr { page-break-inside:avoid; page-break-after:auto }</style><body onload="window.print()">'+divToPrint.innerHTML+'</body>');
          newWin.document.close();
          setTimeout(function(){newWin.close();},10);
    });*/

    $("#print-btn").on("click", function() {
          var divToPrint=document.getElementById('print-barcode');
          var newWin=window.open('','Print-Window');
          newWin.document.open();
          newWin.document.write('<style type="text/css">@media print { #modal_header { display: none } #print-btn { display: none } #close-btn { display: none } } table.barcodelist { page-break-inside:auto } table.barcodelist tr { page-break-inside:avoid; page-break-after:auto }</style><body onload="window.print()">'+divToPrint.innerHTML+'</body>');
          newWin.document.close();
          setTimeout(function(){newWin.close();},10);
    });

</script>
@endpush
