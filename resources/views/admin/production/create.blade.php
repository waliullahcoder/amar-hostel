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
                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                @endforeach
            </select>
        </div>
        {{-- <div class="col-md-4 col-sm-6">
            <label for="product_edition_id" class="form-label"><b>Editions</b></label>
            <select id="product_edition_id" class="select form-select" data-placeholder="Select Room Editions">
                <option value=""></option>
            </select>
        </div> --}}
        <div class="col-md-4 col-6">
            <label for="quantity" class="form-label"><b>Quantity</b></label>
            <input type="number" class="form-control" id="quantity" step="any" value="1" placeholder="Quantity">
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
                            <th class="px-1">Edition</th>
                            <th class="px-1 text-end" width="250">Quantity</th>
                            <th class="px-1 text-center" width="40"><i class="far fa-times"></i></th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                    <tfoot>
                        <tr>
                            <td class="text-end" style="padding: 0.25rem 0.25rem;" colspan="3">
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

        $(document).on('click', '#add_item', function() {

            var product_id = $('#product_id option:selected').val();
            var product = $('#product_id option:selected').text();
            var qty = +$('#quantity').val();
            var sl = $('#tbody tr').length + 1;

            if (product_id == '') {
                Swal.fire({
                    width: "22rem",
                    toast: true,
                    position: 'top-right',
                    text: "Please select a room!",
                    icon: "error",
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }

            if (qty <= 0) {
                Swal.fire({
                    width: "22rem",
                    toast: true,
                    position: 'top-right',
                    text: "Quantity must be greater than 0!",
                    icon: "error",
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }

            // same room already added check
            if ($('#product_' + product_id).length) {
                Swal.fire({
                    width: "22rem",
                    toast: true,
                    position: 'top-right',
                    text: "Room already added!",
                    icon: "error",
                    showConfirmButton: false,
                    timer: 1500
                });
                return false;
            }

            var tr =
                `<tr id="product_${product_id}">
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
                               required>
                    </td>
                    <td class="text-center">
                        <input type="hidden" name="product_id[]" value="${product_id}">
                        <button type="button" class="btn btn-sm btn-danger remove">
                            <i class="far fa-times"></i>
                        </button>
                    </td>
                </tr>`;

            $('#tbody').append(tr);

            $('#quantity').val(1);
            calculate();
        });


        $(document).on('keyup change wheel', '.qty', function() {
            calculate();
        });


        $(document).on('click', '.remove', function() {
            $(this).closest('tr').remove();
            reSerial();
            calculate();
        });


        function calculate() {
            var totalQty = 0;

            $('.qty').each(function() {
                totalQty += +$(this).val();
            });

            $('#totalQty').val(totalQty);
        }


        function reSerial() {
            $('#tbody tr').each(function(index) {
                $(this).find('td:first').text(index + 1);
            });
        }

    });
</script>

@endpush
