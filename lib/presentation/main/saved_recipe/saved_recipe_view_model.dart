import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/saved_recipe_repository.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_state.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final SavedRecipeRepository repository;
  SavedRecipeState _state = const SavedRecipeState();

  SavedRecipeViewModel(this.repository) {
    fetchRecipes();
  }

  SavedRecipeState get state => _state;

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipes: result.data, isLoading: false);
        notifyListeners();
      case Error<List<Recipe>>():
        print(result.e);
    }
  }
}
