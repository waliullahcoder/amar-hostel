@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3 align-items-end">
        <div class="col-sm-6">
            <label for="investor_id" class="form-label"><b>Investor <span class="text-danger">*</span></b></label>
            <select name="investor_id" id="investor_id" class="form-select select" data-placeholder="Select Investor" required>
                <option value=""></option>
                @foreach ($additionalData['investors'] as $investor)
                    <option value="{{ $investor->id }}" {{ $data->investor_id == $investor->id ? 'selected' : '' }}>
                        {{ $investor->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-sm-6">
            <label for="sattlement_no" class="form-label"><b>Sattlement No <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="sattlement_no" name="sattlement_no" placeholder="Sattlement No"
                value="{{ $data->sattlement_no }}" readonly required>
        </div>
        <div class="col-sm-6">
            <label for="date" class="form-label"><b>Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="date" name="date"
                value="{{ date('d-m-Y', strtotime($data->date)) }}" placeholder="Select Payment Date" readonly required>
        </div>
        <div class="col-sm-6">
            <label for="payment_type" class="form-label"><b>Payment Type <span class="text-danger">*</span></b></label>
            @php
                $allDepositTypes = [
                    'Cash Payment' => 'Cash Payment',
                    'Bank Deposit' => 'Bank Deposit',
                    'Bkash' => 'Bkash',
                    'Nagad' => 'Nagad',
                    'Rocket' => 'Rocket',
                ];
            @endphp
            <select class="select form-select" id="payment_type" name="payment_type" data-placeholder="Select Deposit Type"
                required>
                @foreach ($allDepositTypes as $key => $value)
                    <option value="{{ $key }}" {{ $data->payment_type == $key ? 'selected' : '' }}>
                        {{ $value }}</option>
                @endforeach
            </select>
        </div>
        @php
            $invests = \App\Models\Invest::where('investor_id', $data->investor_id)
                ->where('sattled', 0)
                ->orWhereIn('id', $data->list->pluck('invest_id')->toArray())
                ->get();
        @endphp
        <div class="col-sm-6">
            <label for="balance" class="form-label"><b>Balance</b></label>
            <input type="text" class="form-control" id="balance" name="balance"
                value="{{ number_format($invests->sum('amount')) }}" placeholder="Balance" readonly>
        </div>
        <div class="col-sm-6">
            <label for="payment_no" class="form-label"><b>Cash Head <span class="text-danger">*</span></b></label>
            <select name="coa_setup_id" id="coa_setup_id" class="form-select select" data-placeholder="Select Cash Head"
                required>
                <option value=""></option>
                @foreach ($additionalData['cash_heads'] as $item)
                    <option value="{{ $item->id }}" {{ $data->coa_setup_id == $item->id ? 'selected' : '' }}>
                        {{ $item->head_name }} - {{ $item->head_code }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table align-middle mb-0">
                    <thead class="bg-primary border-primary text-white">
                        <tr>
                            <th class="text-center" width="50">SL#</th>
                            <th>Invest No</th>
                            <th class="text-center" width="150">Qty</th>
                            <th class="text-center" width="150">Amount</th>
                            <th class="text-center" width="50">
                                <div class="custom-control custom-checkbox mx-auto">
                                    <input type="checkbox" class="custom-control-input" id="checkAll"
                                        {{ count($invests) == count($data->list) ? 'checked' : '' }}>
                                    <label for="checkAll" class="custom-control-label"></label>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        @foreach ($invests as $item)
                            <tr id="invest_{{ $item->id }}">
                                <td class="text-center px-3">{{ $loop->iteration }}</td>
                                <td class="px-3">{{ $item->invest_no }}</td>
                                <td><input type="number" style="min-height: auto;" class="text-center form-control py-1"
                                        id="qty_{{ $item->id }}" name="qty[{{ $item->id }}]"
                                        value="{{ $item->qty }}" readonly></td>
                                <td><input type="number" style="min-height: auto;" class="text-center form-control py-1"
                                        id="amount_{{ $item->id }}" name="amount[{{ $item->id }}]"
                                        value="{{ $item->amount }}" readonly></td>
                                <td class="text-center">
                                    <div class="custom-control custom-checkbox mx-auto">
                                        <input type="checkbox" class="custom-control-input checkbox invest_id"
                                            id="check_{{ $item->id }}" name="invest_id[]" value="{{ $item->id }}"
                                            {{ in_array($item->id, $data->list->pluck('invest_id')->toArray()) ? 'checked' : '' }}>
                                        <label for="check_{{ $item->id }}" class="custom-control-label"></label>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="bg-primary text-white">
                        <tr>
                            <th class="text-end" colspan="2">Total</th>
                            <th class="text-center">
                                <input type="text" class="form-control py-1 mx-auto text-center"
                                    style="min-height: auto; width: 150px;" id="total_qty" value="{{ $data->qty }}"
                                    placeholder="Total Qty" readonly>
                            </th>
                            <th class="text-center">
                                <input type="text" class="form-control py-1 mx-auto text-center"
                                    style="min-height: auto; width: 150px;" id="total_amount"
                                    value="{{ $data->amount }}" placeholder="Total Amount" readonly>
                            </th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@php
    $currentRouteName = \Request::route()->getName();
@endphp

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#investor_id', function(event) {
                $('#balance').val(0);
                let investor_id = $(this).val();
                let url = "{{ Route($currentRouteName, $data->id) }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        investor_id: investor_id
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#tbody').html('');
                            $.each(response.invests, function(key, item) {
                                var tr =
                                    `<tr id="invest_${item.id}">
                                        <td class="text-center px-3">${key+1}</td>
                                        <td class="px-3">${item.invest_no}</td>
                                        <td><input type="number" style="min-height: auto;" class="text-center form-control py-1" id="qty_${item.id}" name="qty[${item.id}]" value="${item.qty}" readonly></td>
                                        <td><input type="number" style="min-height: auto;" class="text-center form-control py-1" id="amount_${item.id}" name="amount[${item.id}]" value="${item.amount}" readonly></td>
                                        <td class="text-center">
                                            <div class="custom-control custom-checkbox mx-auto">
                                                <input type="checkbox" class="custom-control-input checkbox invest_id" id="check_${item.id}" name="invest_id[]" value="${item.id}" ${response.old_ids.includes(item.id) ? 'checked' : ''}>
                                                <label for="check_${item.id}" class="custom-control-label"></label>
                                            </div>
                                        </td>
                                    </tr>`;
                                $('#tbody').append(tr);
                            });
                            if ($('.invest_id').length == $('.invest_id:checked').length) {
                                $('#checkAll').prop('checked', true);
                            } else {
                                $('#checkAll').prop('checked', false);
                            }
                            $('#balance').val(response.balance);
                            calc();
                        }
                    }
                });
            });

            $(document).on('change', '.checkbox', function(e) {
                if ($('.checkbox:checked').length == $('.checkbox').length) {
                    $('#checkAll').prop('checked', true);
                } else {
                    $('#checkAll').prop('checked', false);
                }
                calc();
            });

            $(document).on('change', '#checkAll', function(e) {
                if ($(this).is(':checked')) {
                    $('.checkbox').prop('checked', true);
                } else {
                    $('.checkbox').prop('checked', false);
                }
                calc();
            });

            function calc() {
                var total_qty = 0;
                var total_amount = 0;
                $('.invest_id:checked').each(function(index, value) {
                    var invest_id = $(this).val();
                    var qty = +$('#qty_' + invest_id).val();
                    var amount = +$('#amount_' + invest_id).val();
                    total_qty += qty;
                    total_amount += amount;
                });
                $('#total_qty').val(total_qty);
                $('#total_amount').val(total_amount);
            }
        });
    </script>
@endpush
