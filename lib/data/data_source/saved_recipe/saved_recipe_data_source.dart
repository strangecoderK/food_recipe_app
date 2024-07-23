import 'package:food_recipe_app/data/model/recipe.dart';

abstract interface class SavedRecipeDataSource {
  Future<List<Recipe>> getRecipes();
}
