import 'package:food_recipe_app/domain/model/recipe_ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required num rating,
    required List<RecipeIngredient> ingredients,
    required String category,
    required DateTime createdAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
