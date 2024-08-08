import 'package:food_recipe_app/domain/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Recipe>> getRecipes();
}
