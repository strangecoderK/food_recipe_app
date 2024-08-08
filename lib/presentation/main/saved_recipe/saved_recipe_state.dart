import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipe_state.freezed.dart';

@freezed
class SavedRecipeState with _$SavedRecipeState {
  const factory SavedRecipeState({
    @Default(false) bool isLoading,
    @Default([]) List<Recipe> recipes,
  }) = _SavedRecipeState;
}
