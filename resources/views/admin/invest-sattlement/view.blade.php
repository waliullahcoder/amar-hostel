@extends('layouts.admin.app')

@section('content')
    <div class="card">
        <div class="card-header pe-2 py-2">
            <div class="d-flex flex-wrap justify-content-between gap-2 align-items-center">
                <h6 class="h6 mb-0 text-uppercase text-nowrap flex-grow-1">
                    {{ @$title ?? 'Please Set Title' }}</h6>
                <a href="{{ Route('admin.invest-sattlement.index') }}" class="btn btn-primary btn-sm">Go Back</a>
            </div>
        </div>
        <div class="card-body px-3">
            <div class="table-responsive-sm">
                <table class="table table-borderless table-striped mb-0">
                    <tbody>
                        <tr>
                            <th width="200">Sattlement No.</th>
                            <th width="10">:</th>
                            <td>{{ $data->sattlement_no }}</td>
                        </tr>
                        <tr>
                            <th width="200">Date</th>
                            <th width="10">:</th>
                            <td>{{ date('d-m-Y', strtotime($data->date)) }}</td>
                        </tr>
                        <tr>
                            <th width="200">Investor</th>
                            <th width="10">:</th>
                            <td>{{ $data->investor->name }}</td>
                        </tr>
                        <tr>
                            <th width="200">Payment Type</th>
                            <th width="10">:</th>
                            <td>{{ $data->payment_type }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive-sm mt-3">
                <table class="table table-borderless table-striped mb-0">
                    <thead class="bg-primary text-white">
                        <tr>
                            <th class="text-center" width="30">SL#</th>
                            <th>Invest No</th>
                            <th class="text-center">Qty</th>
                            <th class="text-center">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data->list as $row)
                            <tr>
                                <td class="text-center" width="30">{{ $loop->iteration }}</td>
                                <td>{{ @$row->invest->invest_no }}</td>
                                <td class="text-center">{{ $row->qty }}</td>
                                <td class="text-center">{{ $row->amount }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="bg-primary text-white">
                        <tr>
                            <th class="text-end" colspan="2">Total</th>
                            <th class="text-center">{{ $data->qty }}</th>
                            <th class="text-center">{{ number_format($data->amount) }}</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection
