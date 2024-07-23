import 'package:food_recipe_app/data/model/ingredient.dart';

abstract interface class IngredientDataSource {
  Future<List<Ingredient>> getIngredients();
}
