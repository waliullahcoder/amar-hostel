@extends('layouts.admin.app')

@section('content')
<div class="row g-3 info-cards">

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-room">
            <div class="card-body">
                <div>
                    <p>Total Rooms</p>
                    <h3>120</h3>
                </div>
                <span class="material-symbols-outlined">hotel</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-available">
            <div class="card-body">
                <div>
                    <p>Available Rooms</p>
                    <h3>45</h3>
                </div>
                <span class="material-symbols-outlined">check_circle</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-occupied">
            <div class="card-body">
                <div>
                    <p>Occupied Rooms</p>
                    <h3>75</h3>
                </div>
                <span class="material-symbols-outlined">meeting_room</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-checkin">
            <div class="card-body">
                <div>
                    <p>Today Check-ins</p>
                    <h3>18</h3>
                </div>
                <span class="material-symbols-outlined">login</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-checkout">
            <div class="card-body">
                <div>
                    <p>Today Check-outs</p>
                    <h3>12</h3>
                </div>
                <span class="material-symbols-outlined">logout</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-guest">
            <div class="card-body">
                <div>
                    <p>Total Guests</p>
                    <h3>210</h3>
                </div>
                <span class="material-symbols-outlined">groups</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-revenue">
            <div class="card-body">
                <div>
                    <p>Today Revenue</p>
                    <h3>৳ 58,000</h3>
                </div>
                <span class="material-symbols-outlined">payments</span>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card info-card bg-due">
            <div class="card-body">
                <div>
                    <p>Pending Payments</p>
                    <h3>৳ 12,500</h3>
                </div>
                <span class="material-symbols-outlined">warning</span>
            </div>
        </div>
    </div>
    

</div>


<!-- Charts Row -->
<div class="row g-4 mt-4">

    <!-- Monthly Revenue Chart -->
    <div class="col-lg-6 col-sm-12">
        <div class="card p-3">
            <h5 class="mb-3">Monthly Revenue (৳)</h5>
            <canvas id="revenueChart" height="250"></canvas>
        </div>
    </div>

    <!-- Room Occupancy Chart -->
    <div class="col-lg-6 col-sm-12">
        <div class="card p-3">
            <h5 class="mb-3">Room Occupancy Status</h5>
            <canvas id="occupancyChart" height="250"></canvas>
        </div>
    </div>

</div>

<style>
.info-card {
    border: none;
    border-radius: 16px;
    color: #fff;
    transition: .3s ease;
}
.info-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 35px rgba(0,0,0,.25);
}

.info-card .card-body {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.info-card p {
    margin: 0;
    font-size: 14px;
    opacity: .95;
}

.info-card h3 {
    margin-top: 4px;
    font-weight: 700;
}

.info-card span {
    font-size: 48px;
    opacity: .95;
}

/* Hotel friendly gradients */
.bg-room      { background: linear-gradient(135deg, #667eea, #764ba2); }
.bg-available { background: linear-gradient(135deg, #00b09b, #96c93d); }
.bg-occupied  { background: linear-gradient(135deg, #ff512f, #dd2476); }
.bg-checkin   { background: linear-gradient(135deg, #36d1dc, #5b86e5); }
.bg-checkout  { background: linear-gradient(135deg, #f7971e, #ffd200); }
.bg-guest     { background: linear-gradient(135deg, #43cea2, #185a9d); }
.bg-revenue   { background: linear-gradient(135deg, #11998e, #38ef7d); }
.bg-due       { background: linear-gradient(135deg, #ff416c, #ff4b2b); }
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Monthly Revenue Chart
    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(revenueCtx, {
        type: 'line',
        data: {
            labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
            datasets: [{
                label: 'Revenue (৳)',
                data: [50000, 60000, 45000, 70000, 65000, 80000, 75000, 82000, 90000, 85000, 95000, 100000],
                borderColor: '#4bc0c0',
                backgroundColor: 'rgba(75,192,192,0.2)',
                tension: 0.4,
                fill: true,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Room Occupancy Chart
    const occupancyCtx = document.getElementById('occupancyChart').getContext('2d');
    const occupancyChart = new Chart(occupancyCtx, {
        type: 'doughnut',
        data: {
            labels: ['Occupied', 'Available', 'Maintenance'],
            datasets: [{
                label: 'Rooms',
                data: [75, 40, 5],
                backgroundColor: ['#ff6384','#36a2eb','#ffcd56'],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: { color: '#333', font: { size: 14 } }
                }
            }
        }
    });
</script>
@endsection

