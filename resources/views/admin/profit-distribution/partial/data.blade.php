<div class="row g-3">

    <div class="col-md-3">
        <label class="form-label"><b>Total Sales</b></label>
        <input type="text" class="form-control" 
            value="{{ $detailData['sales_qty'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Profit</b></label>
        <input type="text" class="form-control" 
            value="{{ $detailData['profit_amount'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Invest Qty</b></label>
        <input type="text" class="form-control" 
            value="{{ $detailData['invest_qty'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Invest Amount</b></label>
        <input type="text" class="form-control" 
            value="{{ $detailData['invest_amount'] }}" readonly>
    </div>

    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>SL</th>
                        <th>Investor</th>
                        <th>Room</th>
                        <th class="text-end">Invest Amount</th>
                        <th class="text-end">Share Qty</th>
                        <th class="text-end">Individual Profit</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($detailData['invests'] as $item)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $item->investor->name }}</td>
                            <td>{{ $item->product->name }}</td>
                            <td class="text-end">{{ $item->amount }}</td>
                            <td class="text-end">{{ $item->qty }}</td>
                            <td class="text-end">
                                {{ $detailData['per_share_profit'] * $item->qty }}
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

</div>
