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
        Schema::create('recipes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->constrained()->onDelete('restrict'); // prevent deletion of category if recipes exist
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // delete recipes if user is deleted                 
            $table->string('title');
            $table->text('description');
            $table->string('recipe_image')->nullable();
            $table->integer('prep_time'); //Preparation time in minutes
            $table->integer('cook_time'); //Cooking time in minutes
            $table->integer('serving_size'); //Number of servings
            //$table->unsignedBigInteger('category_id');
            $table->text('ingredients');
            $table->text('instructions');
            $table->text('nutritional_info');
            $table->boolean('is_featured')->default(false);       
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recipes');
    }
};
