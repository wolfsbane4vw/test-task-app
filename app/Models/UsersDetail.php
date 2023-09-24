<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class UsersDetail extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'agree_to_terms', 'user_session_id'];

    public function sector(): hasMany
    {
        return $this->hasMany(UsersSector::class, 'user_id', 'id');
    }
}
