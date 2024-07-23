import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/saved_recipe/saved_recipe_data_source.dart';

import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository.dart';


class SavedRecipeRepositoryImpl implements SavedRecipeRepository {
  final SavedRecipeDataSource _recipeDataSource;

  const SavedRecipeRepositoryImpl({
    required SavedRecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final result = await _recipeDataSource.getRecipes();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
