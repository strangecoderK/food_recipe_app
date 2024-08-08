import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';

abstract interface class SavedRecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
