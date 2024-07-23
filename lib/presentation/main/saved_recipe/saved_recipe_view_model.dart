import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final SavedRecipeRepository repository;
  bool _isLoading = false;

  SavedRecipeViewModel(this.repository) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
        _isLoading = false;
        notifyListeners();
      case Error<List<Recipe>>():
        print(result.e);
    }
  }
}
