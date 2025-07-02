<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Recipe extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'category_id',
        'user_id',
        'title',
        'description',
        'recipe_image',
        'prep_time',
        'cook_time',
        'serving_size',
        'is_featured',
    ];

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }  
    
    /**
     * Get the user that owns the recipe.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    
    /**
     * Get the nutrition facts for the recipe.
     */
    public function nutritionFacts(): HasOne
    {
        return $this->hasOne(NutritionFact::class);
    }

    /**
     * Get the directions for the recipe.
     */
    public function directions(): HasMany
    {
        return $this->hasMany(Direction::class);
    }    
    
    /**
     * Get the ingredients for the recipe.
     */
    public function ingredients(): BelongsToMany
    {
        return $this->belongsToMany(Ingredient::class, 'recipe_ingredients')
            ->using(RecipeIngredient::class)
            ->withPivot('ingredient_group');
    }

    /**
     * Get total time (prep + cook time).
     */
    public function getTotalTimeAttribute(): int
    {
        return $this->prep_time + $this->cook_time;
    }    
}
