import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';

class SearchViewModel with ChangeNotifier {
  final RecipeRepository repository;

  SearchViewModel({
    required this.repository,
  }) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;

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

  void search(String value) async {
    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data
            .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
        notifyListeners();
      case Error<List<Recipe>>():
        print(result.e);
    }
  }
}
