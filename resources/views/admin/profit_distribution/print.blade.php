@extends('layouts.admin.print_app')
@section('content')
    <table class="table mb-3 info-table" style="border-bottom: 1px solid #ddd;">
        <tr>
            <td>
                <b class="d-inline-block" style="min-width: 90px;">Date :</b>
                <span class="d-inline-block" style="min-width: 200px;">{{ date('d-m-Y', strtotime($data->date)) }}</span>
            </td>
            <td class="text-right">
                <b class="d-inline-block text-left">Month :</b>
                <span class="d-inline-block" style="min-width: 100px;">{{ $data->month }}</span>
            </td>
        </tr>
        <tr>
            <td>
                <b class="d-inline-block" style="min-width: 90px;">Year :</b>
                <span class="d-inline-block" style="min-width: 200px;">{{ $data->year }}</span>
            </td>
            <td class="text-right">
                <b class="d-inline-block text-left">Serial No. :</b>
                <span class="d-inline-block" style="min-width: 100px;">{{ $data->serial_no }}</span>
            </td>
        </tr>
    </table>

    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead class="text-nowrap">
            <tr>
                <th class="text-center" width="20">SL#</th>
                <th>Investor Name</th>
                <th>Phone</th>
                <th>bKash</th>
                <th>Bank</th>
                <th>Account Name</th>
                <th>Account No</th>
                <th class="text-right">Individual Share</th>
                <th class="text-right">Individual Profit</th>
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
                    <td class="text-right">{{ $row->share_qty }}</td>
                    <td class="text-right">{{ $row->amount }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th class="text-right" colspan="7">Total</th>
                <th class="text-right">{{ $data->list->sum('share_qty') }}</th>
                <th class="text-right">{{ $data->list->sum('amount') }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
