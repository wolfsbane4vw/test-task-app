<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasRelationships;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Sector extends Model
{
    use HasFactory, HasRelationships;
    protected $fillable = ['sector_id', 'name', 'parent_id', 'tree_path',];

    public function parent(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_id', 'sector_id');
    }
    public function childrenSectors(): HasMany
    {
        return $this->hasMany(self::class, 'parent_id', 'sector_id');
    }

    public function children(): HasMany
    {
       $children = $this->childrenSectors();
       $children->with('children');

       return $children;
    }
}
