<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'room_id', 'customer_name', 'customer_email', 
        'customer_phone', 'check_in', 'check_out', 
        'guests', 'total_price', 'status'
    ];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }
}
