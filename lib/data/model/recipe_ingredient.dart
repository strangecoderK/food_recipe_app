import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient.freezed.dart';

part 'recipe_ingredient.g.dart';

@freezed
class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required Ingredient ingredient,
    required num amount,
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, Object?> json) => _$RecipeIngredientFromJson(json);
}