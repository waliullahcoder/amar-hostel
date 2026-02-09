<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Auth;

class Invest extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['investor_id', 'invest_no', 'date', 'qty', 'amount', 'deposit_type', 'bkash', 'rocket', 'nagad', 'bank_account', 'remarks', 'calculate', 'approved', 'status', 'sattled', 'coa_setup_id', 'created_by', 'updated_by', 'deleted_by'];

    protected static function booted()
    {
        static::addGlobalScope('calculate', function ($builder) {
            if (!Auth::check() || !Auth::user()->hasRole('Software Admin')) {
                $builder->where('calculate', true);
            }
        });
    }

    public function investor()
    {
        return $this->belongsTo(Investor::class, 'investor_id');
    }

    public function invest_months()
    {
        return $this->hasMany(InvestMonth::class, 'invest_id');
    }

    public function coa()
    {
        return $this->belongsTo(CoaSetup::class, 'coa_setup_id');
    }

    public function getFormattedDateAttribute()
    {
        return date('d-m-Y', strtotime($this->date));
    }

    public function sattlements()
    {
        return $this->hasMany(InvestSattlementList::class, 'invest_id');
    }

    public function transactions()
    {
        return $this->hasMany(AccountTransaction::class, 'voucher_no', 'invest_no')->where('voucher_type', 'Invest');
    }

    protected $appends = ['formattedDate'];
}
