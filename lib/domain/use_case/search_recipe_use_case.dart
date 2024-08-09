import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipeUseCase {
  final RecipeRepository _repository;

  const SearchRecipeUseCase({
    required RecipeRepository repository,
  }) : _repository = repository;

  Future<Result<List<Recipe>>> execute(String value) async {
    final result = await _repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        return Result.success(result.data
            .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
            .toList());
      case Error<List<Recipe>>():
        return Result.error(result.e);
    }
  }
}
