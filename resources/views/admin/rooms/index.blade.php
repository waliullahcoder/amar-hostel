@extends('layouts.admin.app')

@section('content')

{{-- ================= ALERT ================= --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

{{-- ================= HEADER ================= --}}
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0">
        <i class="bi bi-house-door"></i> Room Management
    </h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal" onclick="resetRoomForm()">
        <i class="bi bi-plus-circle"></i> Add Room
    </button>
</div>

{{-- ================= TABLE ================= --}}
<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>#</th>
                    <th>Images</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th width="150">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($rooms as $room)
                <tr class="text-center">
                    <td>{{ $loop->iteration }}</td>

                    {{-- Images --}}
                    <td>
                        <div class="d-flex gap-1 justify-content-center">
                            @foreach(['image','image2','image3','image4'] as $img)
                                @if($room->$img)
                                <img src="{{ asset('storage/'.$room->$img) }}"
                                     class="rounded border"
                                     style="width:45px;height:45px;object-fit:cover">
                                @endif
                            @endforeach
                        </div>
                    </td>

                    <td>{{ $room->name }}</td>
                    <td>{{ $room->category->name ?? 'N/A' }}</td>
                    <td>৳ {{ number_format($room->price) }}</td>
                    <td>{{ $room->capacity }}</td>
                    <td>
                        <span class="badge bg-success">Active</span>
                    </td>

                    {{-- Action --}}
                    <td>
                        <button class="btn btn-sm btn-outline-primary editRoom"
                            data-bs-toggle="modal"
                            data-bs-target="#roomModal"
                            data-room='@json($room)'>
                            <i class="bi bi-pencil"></i>
                        </button>

                        <button class="btn btn-sm btn-outline-success"
                            onclick='viewRoom(@json($room))'>
                            <i class="bi bi-eye"></i>
                        </button>

                        <form action="{{ route('admin.rooms.destroy',$room->id) }}"
                              method="POST" class="d-inline"
                              onsubmit="return confirm('Delete this room?')">
                            @csrf @method('DELETE')
                            <button class="btn btn-sm btn-outline-danger">
                                <i class="bi bi-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="text-center text-muted">No rooms found</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

{{-- ================= ADD / EDIT MODAL ================= --}}
<div class="modal fade" id="roomModal">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <form id="roomForm" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="_method" id="form_method" value="POST">

                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title">
                        <i class="bi bi-house"></i> Room Information
                    </h5>
                    <button class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    {{-- Tabs --}}
                    <ul class="nav nav-pills mb-3 gap-2">
                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#general">
                                <i class="bi bi-info-circle"></i> General
                            </button>
                        </li>
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#price">
                                <i class="bi bi-cash"></i> Pricing
                            </button>
                        </li>
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#seo">
                                <i class="bi bi-google"></i> SEO
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content">

                        {{-- GENERAL --}}
                        <div class="tab-pane fade show active" id="general">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="fw-bold">Room Name</label>
                                    <input type="text" name="name" id="room_name" class="form-control" required>
                                </div>

                                <div class="col-md-4">
                                    <label class="fw-bold">Room Type</label>
                                    <select name="category_id" id="room_category_id" class="form-select">
                                        @foreach($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                @foreach(['image','image2','image3','image4'] as $img)
                                <div class="col-md-4">
                                    <label class="fw-bold text-capitalize">{{ $img }}</label>
                                    <input type="file" name="{{ $img }}" class="form-control">
                                </div>
                                @endforeach

                                <div class="col-12">
                                    <label class="fw-bold">Description</label>
                                    <textarea name="description" id="room_description" rows="3" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                        {{-- PRICE --}}
                        <div class="tab-pane fade" id="price">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="fw-bold">Price</label>
                                    <input type="number" name="price" id="room_price" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="fw-bold">Capacity</label>
                                    <input type="number" name="capacity" id="room_capacity" class="form-control">
                                </div>
                            </div>
                        </div>

                        {{-- SEO --}}
                        <div class="tab-pane fade" id="seo">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="fw-bold">Meta Title</label>
                                    <input type="text" name="meta_title" id="meta_title" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="fw-bold">Meta Keywords</label>
                                    <input type="text" name="meta_keywords" id="meta_keywords" class="form-control">
                                </div>
                                <div class="col-12">
                                    <label class="fw-bold">Meta Description</label>
                                    <textarea name="meta_description" id="meta_description" rows="3" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button class="btn btn-success">Save</button>
                </div>

            </form>
        </div>
    </div>
</div>

{{-- ================= VIEW MODAL ================= --}}
<div class="modal fade" id="viewRoomModal">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">
                    <i class="bi bi-eye"></i> Room Details
                </h5>
                <button class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <div class="row g-2 mb-3">
                    <div class="col-3"><img id="v_img1" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img2" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img3" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img4" class="img-fluid rounded"></div>
                </div>

                <p><strong>Name:</strong> <span id="v_name"></span></p>
                <p><strong>Price:</strong> <span id="v_price"></span></p>
                <p><strong>Capacity:</strong> <span id="v_capacity"></span></p>
                <p><strong>Description:</strong> <span id="v_description"></span></p>

            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

{{-- ================= JS ================= --}}
<script>
function resetRoomForm(){
    roomForm.reset();
    roomForm.action = "{{ route('admin.rooms.store') }}";
    form_method.value = "POST";
}

document.querySelectorAll('.editRoom').forEach(btn=>{
    btn.onclick = ()=>{
        let r = JSON.parse(btn.dataset.room);
        roomForm.action = `/admin/rooms/${r.id}`;
        form_method.value = "PUT";
        room_name.value = r.name;
        room_price.value = r.price;
        room_capacity.value = r.capacity;
        room_description.value = r.description;
        room_category_id.value = r.category_id;
        meta_title.value = r.meta_title ?? '';
        meta_keywords.value = r.meta_keywords ?? '';
        meta_description.value = r.meta_description ?? '';
    }
});

function viewRoom(r){
    ['image','image2','image3','image4'].forEach((i,idx)=>{
        document.getElementById('v_img'+(idx+1)).src = r[i] ? '/storage/'+r[i] : '/no-image.png';
    });
    v_name.textContent = r.name;
    v_price.textContent = '৳ '+Number(r.price).toLocaleString();
    v_capacity.textContent = r.capacity;
    v_description.textContent = r.description ?? 'N/A';
    new bootstrap.Modal(viewRoomModal).show();
}
</script>

{{-- ================= CSS ================= --}}
<style>
.modal-content{border-radius:14px}
.table img{transition:.2s}
.table img:hover{transform:scale(1.2)}
.nav-pills .nav-link.active{
    background:linear-gradient(45deg,#0d6efd,#6610f2);
}
</style>

@endsection
