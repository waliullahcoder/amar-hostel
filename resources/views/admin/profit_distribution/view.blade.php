@extends('layouts.admin.app')

@section('content')
    <div class="card">
        <div class="card-header pe-2 py-2">
            <div class="d-flex flex-wrap justify-content-between gap-2 align-items-center">
                <h6 class="h6 mb-0 text-uppercase text-nowrap flex-grow-1">{{ @$title ?? 'Please Set Title' }}</h6>
                <a href="{{ Route('admin.profit-distribute.index') }}" class="btn btn-primary btn-sm">Go
                    Back</a>
            </div>
        </div>
        <div class="card-body px-3">
            <table class="table table-borderless table-striped table-responsive-sm">
                <tbody>
                    <tr>
                        <th width="200">Date</th>
                        <th width="10">:</th>
                        <td>{{ date('d-m-Y', strtotime($data->date)) }}</td>
                    </tr>
                    <tr>
                        <th width="200">Month</th>
                        <th width="10">:</th>
                        <td>{{ $data->month }}</td>
                    </tr>
                    <tr>
                        <th width="200">Year</th>
                        <th width="10">:</th>
                        <td>{{ $data->year }}</td>
                    </tr>
                    <tr>
                        <th width="200">Serial No.</th>
                        <th width="10">:</th>
                        <td>{{ $data->serial_no }}</td>
                    </tr>
                    <tr>
                        <th width="200">Total Share</th>
                        <th width="10">:</th>
                        <td>{{ $data->total_share }}</td>
                    </tr>
                </tbody>
            </table>

            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="bg-primary text-white">
                            <th class="text-center" width="30">SL#</th>
                            <th>Investor Name</th>
                            <th>Phone</th>
                            <th>bKash</th>
                            <th>Bank</th>
                            <th>Account Name</th>
                            <th>Account No</th>
                            <th class="text-center">Individual Share</th>
                            <th class="text-center">Individual Profit</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data->list as $row)
                            <tr>
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td>{{ @$row->investor->name }}</td>
                                <td>{{ @$row->investor->phone }}</td>
                                <td>{{ @$row->investor->bkash }}</td>
                                <td>{{ @$row->investor->bank }}</td>
                                <td>{{ @$row->investor->account_name }}</td>
                                <td>{{ @$row->investor->account_no }}</td>
                                <td class="text-center">{{ $row->share_qty }}</td>
                                <td class="text-center">{{ $row->amount }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr class="bg-primary text-white">
                            <th class="text-end" colspan="7">Total</th>
                            <th class="text-center">{{ $data->list->sum('share_qty') }}</th>
                            <th class="text-center">{{ $data->list->sum('amount') }}</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection
