@extends('layouts.admin.app')

@section('content')

{{-- ALERT --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>Room</th>
                    <th>User</th>
                    <th>Guests</th>
                    <th>Available</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th width="160">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($bookings as $booking)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $booking->room->name ?? '-' }}</td>
                    <td>{{ $booking->user->name ?? '-' }}</td>
                    <td>{{ $booking->guests }}</td>
                    <td>{{ $booking->room->capacity ?? '-' }}</td>
                    <td>{{ $booking->check_in }}</td>
                    <td>{{ $booking->check_out }}</td>
                    <td>৳ {{ number_format($booking->total_price) }}</td>
                    <td>
                       <span class="badge 
                        @if($booking->status == 'pending') bg-warning
                        @elseif($booking->status == 'confirmed') bg-primary
                        @elseif($booking->status == 'checked_in') bg-success
                        @elseif($booking->status == 'checked_out') bg-secondary
                        @elseif($booking->status == 'cancelled') bg-danger
                        @else bg-info
                        @endif
                    ">
                        {{ ucfirst(str_replace('_',' ', $booking->status)) }}
                    </span>

                    </td>
                    <td>
                        <button class="btn btn-sm btn-primary"
                            onclick='openStatusModal(@json($booking))'
                            data-bs-toggle="modal"
                            data-bs-target="#statusModal">
                            Resrvation
                        </button>

                        <button class="btn btn-sm btn-success"
                            onclick='viewBooking(@json($booking))'>
                            View
                        </button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="9" class="text-center text-muted">No booking found</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

{{-- ================= STATUS EDIT MODAL ================= --}}
<div class="modal fade" id="statusModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <form method="POST" id="statusForm">
                @csrf
                @method('PUT')

                <div class="modal-header">
                    <h5 class="modal-title">Change Reservation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Status</label>
                        <select name="status" id="booking_status" class="form-select" required>
                            <option value="pending">Pending</option>
                            <option value="confirmed">Confirmed</option>
                            <option value="checked_in">Checked In</option>
                            <option value="checked_out">Checked Out</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Update</button>
                </div>

            </form>
        </div>
    </div>
</div>

{{-- ================= VIEW MODAL ================= --}}
<div class="modal fade" id="viewBookingModal">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Booking Details</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <table class="table table-bordered">
                    <tr><th>Room</th><td id="v_room"></td></tr>
                    <tr><th>User</th><td id="v_user"></td></tr>
                    <tr><th>Guests</th><td id="v_guests"></td></tr>
                    <tr><th>Check In</th><td id="v_checkin"></td></tr>
                    <tr><th>Check Out</th><td id="v_checkout"></td></tr>
                    <tr><th>Total Price</th><td id="v_price"></td></tr>
                    <tr><th>Status</th><td id="v_status"></td></tr>
                </table>
            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

{{-- ================= SCRIPTS ================= --}}
<script>
function openStatusModal(booking){
    document.getElementById('booking_status').value = booking.status;
    document.getElementById('statusForm').action = '/admin/bookings/' + booking.id;
}

function viewBooking(booking){
    document.getElementById('v_room').textContent = booking.room?.name ?? '-';
    document.getElementById('v_user').textContent = booking.user?.name ?? '-';
    document.getElementById('v_guests').textContent = booking.guests;
    document.getElementById('v_checkin').textContent = booking.check_in;
    document.getElementById('v_checkout').textContent = booking.check_out;
    document.getElementById('v_price').textContent = '৳ ' + booking.total_price;
    document.getElementById('v_status').textContent = booking.status;

    new bootstrap.Modal(document.getElementById('viewBookingModal')).show();
}
</script>

@endsection
