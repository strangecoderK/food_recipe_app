import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  const RecipeRepositoryImpl({
    required RecipeDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final result = await _dataSource.getRecipes();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
