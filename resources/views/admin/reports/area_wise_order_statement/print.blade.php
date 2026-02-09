@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead class="text-nowrap">
            <tr>
                <th class="text-center" width="30">SL#</th>
                <th>Area Name</th>
                <th class="text-center">Total</th>
                <th class="text-center">01</th>
                <th class="text-center">02</th>
                <th class="text-center">03</th>
                <th class="text-center">04</th>
                <th class="text-center">05</th>
                <th class="text-center">06</th>
                <th class="text-center">07</th>
                <th class="text-center">08</th>
                <th class="text-center">09</th>
                <th class="text-center">10</th>
                <th class="text-center">11</th>
                <th class="text-center">12</th>
                <th class="text-center">13</th>
                <th class="text-center">14</th>
                <th class="text-center">15</th>
                <th class="text-center">16</th>
                <th class="text-center">17</th>
                <th class="text-center">18</th>
                <th class="text-center">19</th>
                <th class="text-center">20</th>
                <th class="text-center">21</th>
                <th class="text-center">22</th>
                <th class="text-center">23</th>
                <th class="text-center">24</th>
                <th class="text-center">25</th>
                <th class="text-center">26</th>
                <th class="text-center">27</th>
                <th class="text-center">28</th>
                <th class="text-center">29</th>
                <th class="text-center">30</th>
                <th class="text-center">31</th>
            </tr>
        </thead>
        <tbody>
            @php
                $all_total = 0;
                $total1 = 0;
                $total2 = 0;
                $total3 = 0;
                $total4 = 0;
                $total5 = 0;
                $total6 = 0;
                $total7 = 0;
                $total8 = 0;
                $total9 = 0;
                $total10 = 0;
                $total11 = 0;
                $total12 = 0;
                $total13 = 0;
                $total14 = 0;
                $total15 = 0;
                $total16 = 0;
                $total17 = 0;
                $total18 = 0;
                $total19 = 0;
                $total20 = 0;
                $total21 = 0;
                $total22 = 0;
                $total23 = 0;
                $total24 = 0;
                $total25 = 0;
                $total26 = 0;
                $total27 = 0;
                $total28 = 0;
                $total29 = 0;
                $total30 = 0;
                $total31 = 0;
                $month = request('month') ?? date('m');
                if (Str::length($month) == 1) {
                    $month = '0' . $month;
                }
                $year = request('year') ?? ($year = date('Y'));
                $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                $end_date = date('Y-m-t', strtotime($year . '-' . $month));
            @endphp
            @foreach ($data as $row)
                <tr>
                    <td class="text-center">{{ $loop->iteration }}</td>
                    <td>{{ $row->name }}</td>
                    <td class="text-center">
                        @php
                            $total = \App\Models\CustomerBookings::where('date', '>=', $start_date)
                                ->where('date', '<=', $end_date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $all_total += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total1 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-02'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total2 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-03'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total3 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-04'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total4 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-05'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total5 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-06'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total6 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-07'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total7 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-08'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total8 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-09'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total9 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-10'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total10 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-11'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total11 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-12'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total12 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-13'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total13 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-14'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total14 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-15'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total15 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-16'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total16 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-17'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total17 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-18'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total18 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-19'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total19 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-20'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total20 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-21'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total21 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-22'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total22 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-23'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total23 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-24'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total24 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-25'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total25 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-26'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total26 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-27'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total27 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-28'));
                            $total = \App\Models\CustomerBookings::where('date', $date)
                                ->where('area_id', $row->id)
                                ->sum('qty');
                            $total28 += $total;
                            echo $total > 0 ? $total : '-';
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-29'));
                            if ($date == $year . '-' . $month . '-29') {
                                $total = \App\Models\CustomerBookings::where('date', $date)
                                    ->where('area_id', $row->id)
                                    ->sum('qty');
                                $total29 += $total;
                                echo $total > 0 ? $total : '-';
                            } else {
                                echo '-';
                            }
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-30'));
                            if ($date == $year . '-' . $month . '-30') {
                                $total = \App\Models\CustomerBookings::where('date', $date)
                                    ->where('area_id', $row->id)
                                    ->sum('qty');
                                $total29 += $total;
                                echo $total > 0 ? $total : '-';
                            } else {
                                echo '-';
                            }
                        @endphp
                    </td>
                    <td class="text-center">
                        @php
                            $date = date('Y-m-d', strtotime($year . '-' . $month . '-31'));
                            if ($date == $year . '-' . $month . '-31') {
                                $total = \App\Models\CustomerBookings::where('date', $date)
                                    ->where('area_id', $row->id)
                                    ->sum('qty');
                                $total29 += $total;
                                echo $total > 0 ? $total : '-';
                            } else {
                                echo '-';
                            }
                        @endphp
                    </td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="2" class="text-right">Total</th>
                <th class="text-center">{{ $all_total > 0 ? $all_total : '-' }}</th>
                <th class="text-center">{{ $total1 > 0 ? $total1 : '-' }}</th>
                <th class="text-center">{{ $total2 > 0 ? $total2 : '-' }}</th>
                <th class="text-center">{{ $total3 > 0 ? $total3 : '-' }}</th>
                <th class="text-center">{{ $total4 > 0 ? $total4 : '-' }}</th>
                <th class="text-center">{{ $total5 > 0 ? $total5 : '-' }}</th>
                <th class="text-center">{{ $total6 > 0 ? $total6 : '-' }}</th>
                <th class="text-center">{{ $total7 > 0 ? $total7 : '-' }}</th>
                <th class="text-center">{{ $total8 > 0 ? $total8 : '-' }}</th>
                <th class="text-center">{{ $total9 > 0 ? $total9 : '-' }}</th>
                <th class="text-center">{{ $total10 > 0 ? $total10 : '-' }}</th>
                <th class="text-center">{{ $total11 > 0 ? $total11 : '-' }}</th>
                <th class="text-center">{{ $total12 > 0 ? $total12 : '-' }}</th>
                <th class="text-center">{{ $total13 > 0 ? $total13 : '-' }}</th>
                <th class="text-center">{{ $total14 > 0 ? $total14 : '-' }}</th>
                <th class="text-center">{{ $total15 > 0 ? $total15 : '-' }}</th>
                <th class="text-center">{{ $total16 > 0 ? $total16 : '-' }}</th>
                <th class="text-center">{{ $total17 > 0 ? $total17 : '-' }}</th>
                <th class="text-center">{{ $total18 > 0 ? $total18 : '-' }}</th>
                <th class="text-center">{{ $total19 > 0 ? $total19 : '-' }}</th>
                <th class="text-center">{{ $total20 > 0 ? $total20 : '-' }}</th>
                <th class="text-center">{{ $total21 > 0 ? $total21 : '-' }}</th>
                <th class="text-center">{{ $total22 > 0 ? $total22 : '-' }}</th>
                <th class="text-center">{{ $total23 > 0 ? $total23 : '-' }}</th>
                <th class="text-center">{{ $total24 > 0 ? $total24 : '-' }}</th>
                <th class="text-center">{{ $total25 > 0 ? $total25 : '-' }}</th>
                <th class="text-center">{{ $total26 > 0 ? $total26 : '-' }}</th>
                <th class="text-center">{{ $total27 > 0 ? $total27 : '-' }}</th>
                <th class="text-center">{{ $total28 > 0 ? $total28 : '-' }}</th>
                <th class="text-center">{{ $total29 > 0 ? $total29 : '-' }}</th>
                <th class="text-center">{{ $total30 > 0 ? $total30 : '-' }}</th>
                <th class="text-center">{{ $total31 > 0 ? $total31 : '-' }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
