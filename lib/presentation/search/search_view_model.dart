import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecipeRepository repository;

  SearchViewModel({
    required this.repository,
  }) {
    fetchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

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

  void search(String value) async {
    final result = await repository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
            recipes: result.data
                .where(
                    (e) => e.name.toLowerCase().contains(value.toLowerCase()))
                .toList());
        notifyListeners();
      case Error<List<Recipe>>():
        print(result.e);
    }
  }
}
