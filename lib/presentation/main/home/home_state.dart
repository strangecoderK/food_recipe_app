import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<String> categories,
    @Default([]) List<Recipe> recipes,
    @Default([]) List<Recipe> selectedRecipes,
    @Default(true) bool isLoading,
    @Default('All') String selectedCategory,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, Object?> json) =>
      _$HomeStateFromJson(json);
}
