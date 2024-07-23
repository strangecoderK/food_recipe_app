import 'package:food_recipe_app/data/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipe>> getRecipes();
}