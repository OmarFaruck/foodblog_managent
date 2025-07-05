<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class NutritionFact extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'recipe_id',
        'calories',
        'protein',
        'fat',
        'carbohydrates',
        'cholesterol',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'calories' => 'float',
        'protein' => 'float',
        'fat' => 'float',
        'carbohydrates' => 'float',
        'cholesterol' => 'float',
    ];

    /**
     * Get the recipe that owns the nutrition facts.
     */
    public function recipe(): BelongsTo
    {
        return $this->belongsTo(Recipe::class);
    }
}
