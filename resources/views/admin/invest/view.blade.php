@extends('layouts.admin.app')

@section('content')
    <div class="card">
        <div class="card-header pe-2 py-2">
            <div class="d-flex flex-wrap justify-content-between gap-2 align-items-center">
                <h6 class="h6 mb-0 text-uppercase text-nowrap flex-grow-1">
                    {{ @$title ?? 'Please Set Title' }}</h6>
                <a href="{{ Route('admin.invest.index') }}" class="btn btn-primary btn-sm">Go Back</a>
            </div>
        </div>
        <div class="card-body px-3">
            <div class="table-responsive-sm">
                <table class="table table-borderless table-striped mb-0">
                    <tbody>
                        <tr>
                            <th width="200">Investor Name</th>
                            <th width="10">:</th>
                            <td>{{ @$data->investor->name }}</td>
                        </tr>
                        <tr>
                            <th width="200">Invest No.</th>
                            <th width="10">:</th>
                            <td>{{ @$data->invest_no }}</td>
                        </tr>
                        <tr>
                            <th width="200">Date</th>
                            <th width="10">:</th>
                            <td>{{ date('d-m-Y', strtotime(@$data->date)) }}</td>
                        </tr>
                        <tr>
                            <th width="200">Cash Head</th>
                            <th width="10">:</th>
                            <td>{{ @$data->coa->head_name }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive-sm mt-4">
                <table class="table table-borderless table-striped mb-0">
                    <thead class="bg-primary text-white">
                        <tr>
                            <th class="text-center" width="30">SL#</th>
                            <th>Date</th>
                            <th>Month</th>
                            <th>Year</th>
                            <th>Qty</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data->invest_months as $item)
                            <tr>
                                <td class="text-center" width="30">{{ $loop->iteration }}</td>
                                <td>{{ date('d-m-Y', strtotime($item->date)) }}</td>
                                <td>{{ $item->month }}</td>
                                <td>{{ $item->year }}</td>
                                <td>{{ $item->qty }}</td>
                                <td>{{ number_format($item->amount) }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
