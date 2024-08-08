import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource datasource;

  const IngredientRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Result<List<Ingredient>>> getIngredient() async {
    try {
      final result = await datasource.getIngredients();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
