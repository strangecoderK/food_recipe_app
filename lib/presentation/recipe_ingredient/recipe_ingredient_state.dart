import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient_state.freezed.dart';



@freezed
class RecipeIngredientState with _$RecipeIngredientState {
  const factory RecipeIngredientState({
    Profile? chef,
    @Default([]) List<Procedure> procedureList,
  }) = _RecipeIngredientState;

}
