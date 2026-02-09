<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InvestSattlement extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['investor_id', 'sattlement_no', 'date', 'qty', 'amount', 'payment_type', 'remarks', 'approved', 'status', 'coa_setup_id', 'created_by', 'updated_by', 'deleted_by'];

    protected static function booted()
    {
       
    }

    public function investor()
    {
        return $this->belongsTo(Investor::class, 'investor_id');
    }

    public function list()
    {
        return $this->hasMany(InvestSattlementList::class, 'invest_sattlement_id');
    }

    public function coa()
    {
        return $this->belongsTo(CoaSetup::class, 'coa_setup_id');
    }

    public function getFormattedDateAttribute()
    {
        return date('d-m-Y', strtotime($this->date));
    }

    protected $appends = ['formattedDate'];
}
