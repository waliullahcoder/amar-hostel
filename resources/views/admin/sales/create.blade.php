@extends('layouts.admin.create_app')

@section('content')
<div class="row g-3">

    {{-- Sale Type --}}
    <div class="col-md-3 col-sm-6" id="sale_type_area">
        <label class="form-label"><b>Sale Type *</b></label>
        <select name="sale_type" id="sale_type" class="form-select select" data-placeholder="Sale Type" required>
            <option value="Credit">Credit</option>
            <option value="Cash">Cash</option>
        </select>
    </div>

    {{-- Cash Account --}}
    <div class="col-md-3 col-sm-6" id="accounts_area" style="display:none;">
        <label class="form-label"><b>Cash Account *</b></label>
        <select name="coa_id" id="coa_id" class="form-select select" data-placeholder="Select Cash Account">
            <option value="">Select Cash Account</option>
            @foreach ($cash_heads as $item)
                <option value="{{ $item->id }}">
                    {{ $item->head_name }} - {{ $item->head_code }}
                </option>
            @endforeach
        </select>
    </div>

    {{-- Invoice --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Invoice No *</b></label>
        <input type="text" class="form-control" name="invoice" value="{{ $invoice }}" readonly required>
    </div>

    {{-- Date --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Date *</b></label>
        <input type="text" class="form-control date_picker" name="date" value="{{ date('d-m-Y') }}" required>
    </div>

    {{-- Store --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Store *</b></label>
        <select name="store_id" id="store_id" class="form-select select" data-placeholder="Select Store" required>
            @foreach ($stores as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    {{-- Client --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Client *</b></label>
        <select name="client_id" class="form-select select" data-placeholder="Select Client" required>
            <option value=""></option>
            @foreach ($clients as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    {{-- Product --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Rooms</b></label>
        <select id="product_id" class="form-select select" data-placeholder="Select Product">
            <option value=""></option>
            @foreach ($products as $item)
                <option value="{{ $item->id }}"
                        data-price="{{ $item->client_price }}"
                        data-commission="{{ $item->client_commission }}"
                        data-rate="{{ $item->net_price }}">
                    {{ $item->name }}
                </option>
            @endforeach
        </select>
    </div>

    {{-- Stock --}}
    <div class="col-md-2 col-6">
        <label class="form-label"><b>Stock</b></label>
        <input type="number" id="stock" class="form-control" readonly value="0">
    </div>

    {{-- Quantity --}}
    <div class="col-md-2 col-6">
        <label class="form-label"><b>Quantity</b></label>
        <input type="number" id="quantity" class="form-control" value="1">
    </div>

    {{-- Add Button --}}
    <div class="col-md-2 col-sm-6">
        <label class="form-label text-white d-none d-sm-block">.</label>
        <button type="button" class="btn btn-primary w-100" id="add_item">
            Add Product
        </button>
    </div>

    {{-- TABLE --}}
    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th width="30">SL</th>
                        <th>Book</th>
                        <th width="120">Price</th>
                        <th width="120">Commission %</th>
                        <th width="120">Net Price</th>
                        <th width="120">Qty</th>
                        <th width="120">Amount</th>
                        <th width="40"></th>
                    </tr>
                </thead>
                <tbody id="tbody"></tbody>
                <tfoot>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Total</b></td>
                        <td><input type="number" id="total_amount" name="total_amount"
                                class="form-control text-end" readonly value="0"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Discount</b></td>
                        <td><input type="number" id="discount" name="discount"
                                class="form-control text-end" value="0"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Net</b></td>
                        <td><input type="number" id="net_amount" name="net_amount"
                                class="form-control text-end" readonly value="0"></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</div>
@endsection

@push('js')
<script>
$(function(){

    // Select2 init
    $('.select').select2({
        theme: 'bootstrap-5',
        width: '100%'
    });

    // Sale type toggle
    $('#sale_type').change(function(){
        if($(this).val() == 'Cash'){
            $('#accounts_area').show();
            $('#coa_id').prop('required',true);
        }else{
            $('#accounts_area').hide();
            $('#coa_id').prop('required',false);
        }
    });

    // Stock check (product_id অনুযায়ী)
        $('#product_id').change(function(){
            let product_id = $(this).val();

            if(product_id){
                $.post('{{ request()->fullUrl() }}',{
                    _method:'GET',
                    product_id:product_id
                }, function(res){
                    if(res.status=='success'){
                        $('#stock').val(res.stock);
                    }
                });
            } else {
                $('#stock').val(0);
            }
        });


    // Add product
    $('#add_item').click(function(){
        let product_id = $('#product_id').val();
        let product = $('#product_id option:selected').text();
        let price = +$('#product_id option:selected').data('price');
        let commission = +$('#product_id option:selected').data('commission');
        let rate = +$('#product_id option:selected').data('rate');
        let qty = +$('#quantity').val();
        let stock = +$('#stock').val();
        let sl = $('#tbody tr').length + 1;

        if(!product_id){
            alert('Please select a product!');
            return;
        }

        if(qty <=0 || qty > stock){
            alert('Stock not available!');
            return;
        }

        if($('#product_'+product_id).length){
            alert('Product already added!');
            return;
        }

        let tr = `<tr id="product_${product_id}">
            <td>${sl}</td>
            <td>${product}</td>
            <td><input type="number" class="form-control price text-end"
                data-id="${product_id}" id="price_${product_id}"
                name="price[${product_id}]" value="${price}"></td>
            <td><input type="number" class="form-control commission text-end"
                data-id="${product_id}" id="commission_${product_id}"
                name="commission[${product_id}]" value="${commission}"></td>
            <td><input type="number" class="form-control text-end"
                id="rate_${product_id}" value="${rate}" readonly></td>
            <td><input type="number" class="form-control qty text-end"
                data-id="${product_id}" id="qty_${product_id}"
                name="qty[${product_id}]" value="${qty}"></td>
            <td><input type="number" class="form-control text-end"
                id="amount_${product_id}" readonly value="${rate*qty}"></td>
            <td>
                <input type="hidden" class="product_id" name="product_id[]" value="${product_id}">
                <button type="button" class="btn btn-sm btn-danger remove">X</button>
            </td>
        </tr>`;

        $('#tbody').append(tr);
        calculate();
    });

    // Remove product
    $(document).on('click','.remove',function(){
        $(this).closest('tr').remove();
        calculate();
    });

    // Calculate totals
    $(document).on('keyup change','.price,.commission,.qty,#discount',function(){
        calculate();
    });

    function calculate(){
        let total = 0;

        $('.product_id').each(function(){
            let id = $(this).val();
            let price = +$('#price_'+id).val();
            let commission = +$('#commission_'+id).val();
            let qty = +$('#qty_'+id).val();

            let rate = Math.round(price - (price*(commission/100)));
            $('#rate_'+id).val(rate);

            let amount = rate*qty;
            $('#amount_'+id).val(amount);

            total += amount;
        });

        $('#total_amount').val(total);
        let discount = +$('#discount').val();
        $('#net_amount').val(total-discount);
    }

});
</script>
@endpush
