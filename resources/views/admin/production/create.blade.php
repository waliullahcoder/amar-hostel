@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
<div class="col-md-4 col-sm-6">
            <label for="production" class="form-label"><b>Production No. <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="production" name="production" value="{{ $production_no }}" readonly
                placeholder="Production No." required>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="date" class="form-label"><b>Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="date" name="date"
                value="{{ date('d-m-Y', strtotime(old('date', date('d-m-Y')))) }}" placeholder="Date" required>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="store_id" class="form-label"><b>Store</b></label>
            <select id="store_id" name="store_id" class="select form-select" data-placeholder="Select Store">
                @foreach ($stores as $item)
                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="product_id" class="form-label"><b>Rooms</b></label>
            <select id="product_id" class="select form-select" data-placeholder="Select Room">
                <option value=""></option>
                @foreach ($products as $item)
                    <option value="{{ $item->id }}"
                            data-capacity="{{ $item->capacity }}"
                            data-available="{{ $item->available }}">
                        {{ $item->name }}
                    </option>
                @endforeach
            </select>
            <small id="room_info" class="text-muted"></small>
        </div>

        <div class="col-md-4 col-6">
            <label for="quantity" class="form-label"><b>Quantity</b></label>
            <input type="number" class="form-control" id="quantity" step="1" value="1" placeholder="Quantity">
        </div>

        <div class="col-md-4 col-6">
            <label class="form-label text-white"><b>Add Item</b></label>
            <button type="button" class="btn btn-xs btn-primary w-100 py-2" id="add_item">Add Product</button>
        </div>

        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped align-middle mb-0">
                    <thead class="bg-primary border-primary text-white text-nowrap">
                        <tr>
                            <th class="px-2 text-center" width="30">SL#</th>
                            <th class="px-1">Room Name</th>
                            <th class="px-1">Quantity</th>
                            <th class="px-1 text-center" width="40"><i class="far fa-times"></i></th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-end" style="padding: 0.25rem 0.25rem;" colspan="2">
                                <b style="width: 100px;">Total Qty</b>
                            </td>
                            <td style="padding: 2px 0.25rem;" colspan="1">
                                <input type="number" id="totalQty" name="total_qty" readonly
                                    class="form-control input-sm text-end" placeholder="Total Qty" value="0">
                            </td>
                            <td style="padding: 2px 0.25rem;"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </div>
@endsection

@push('js')
<script type="text/javascript">
$(document).ready(function() {

    // Show capacity & available
    $('#product_id').on('change', function() {
        var selected = $(this).find(':selected');
        var capacity = selected.data('capacity') || 0;
        var available = selected.data('available') || 0;

        if (selected.val() == '') {
            $('#room_info').text('');
            return;
        }

        $('#room_info').text(`Capacity: ${capacity}, Available: ${available}`);
        $('#quantity').val(1);
    });

    // Add item
    $(document).on('click', '#add_item', function() {
        var product_id = $('#product_id option:selected').val();
        var product = $('#product_id option:selected').text();
        var qty = +$('#quantity').val();
        var available = $('#product_id option:selected').data('available') || 0;
        var sl = $('#tbody tr').length + 1;

        if (product_id == '') {
            Swal.fire({toast:true,position:'top-right',text:"Please select a room!",icon:"error",timer:1500,showConfirmButton:false});
            return false;
        }

        if (qty <= 0) {
            Swal.fire({toast:true,position:'top-right',text:"Quantity must be greater than 0!",icon:"error",timer:1500,showConfirmButton:false});
            return false;
        }

        // same room already added
        if ($('#product_' + product_id).length) {
            // check how much already added
            var existingQty = +$('#qty_' + product_id).val();
            var totalAvailable = available - existingQty;

            if(totalAvailable <= 0){
                Swal.fire({toast:true,position:'top-right',text:`No more available for this room!`,icon:"error",timer:2000,showConfirmButton:false});
                return false;
            }

            if(qty > totalAvailable){
                qty = totalAvailable;
                Swal.fire({toast:true,position:'top-right',text:`Only ${qty} remaining, adding that.`,icon:"info",timer:2000,showConfirmButton:false});
            }

            $('#qty_' + product_id).val(existingQty + qty);
            calculate();
            return true;
        }

        // New row, check available
        if(qty > available){
            qty = available;
            Swal.fire({toast:true,position:'top-right',text:`Only ${qty} available, adding that.`,icon:"info",timer:2000,showConfirmButton:false});
        }

        var tr = `
            <tr id="product_${product_id}">
                <td class="text-center">${sl}</td>
                <td class="text-nowrap">${product}</td>
                <td>
                    <input type="number" 
                           class="form-control text-end qty" 
                           min="1" 
                           step="1" 
                           id="qty_${product_id}" 
                           name="qty[${product_id}]" 
                           value="${qty}" 
                           required
                           max="${available}">
                </td>
                <td class="text-center">
                    <input type="hidden" name="product_id[]" value="${product_id}">
                    <button type="button" class="btn btn-sm btn-danger remove">
                        <i class="far fa-times"></i>
                    </button>
                </td>
            </tr>`;

        $('#tbody').append(tr);
        calculate();
    });

    // Quantity change check
    $(document).on('keyup change wheel', '.qty', function() {
        var max = +$(this).attr('max') || 0;
        if(+$(this).val() > max){
            $(this).val(max);
            Swal.fire({toast:true,position:'top-right',text:`Max allowed quantity is ${max}`,icon:"error",timer:2000,showConfirmButton:false});
        }
        calculate();
    });

    // Remove row
    $(document).on('click', '.remove', function() {
        $(this).closest('tr').remove();
        reSerial();
        calculate();
    });

    // Calculate total qty
    function calculate() {
        var totalQty = 0;
        $('.qty').each(function() {
            totalQty += +$(this).val();
        });
        $('#totalQty').val(totalQty);
    }

    // Re-serial number
    function reSerial() {
        $('#tbody tr').each(function(index) {
            $(this).find('td:first').text(index + 1);
        });
    }

});
</script>
@endpush
