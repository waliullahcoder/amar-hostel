<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AccountTransactionAuto extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['voucher_no', 'voucher_type', 'voucher_date', 'coa_setup_id', 'coa_head_code', 'narration', 'debit_amount', 'credit_amount', 'document', 'posted', 'approve', 'approve_by', 'created_by', 'updated_by', 'deleted_by'];

    public function coa()
    {
        return $this->belongsTo(CoaSetup::class, 'coa_setup_id');
    }
}
