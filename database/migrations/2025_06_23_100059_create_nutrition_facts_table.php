<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('nutrition_facts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('recipe_id')->constrained()->onDelete('cascade');
            $table->float('calories')->nullable();
            $table->float('protein')->nullable()->comment('in grams');
            $table->float('fat')->nullable()->comment('in grams');
            $table->float('carbohydrates')->nullable()->comment('in grams');
            $table->float('cholesterol')->nullable()->comment('in mg');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nutrition_facts');
    }
};
