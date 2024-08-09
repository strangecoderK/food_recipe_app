import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/search_recipe_use_case.dart';
import 'package:food_recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final GetRecipesUseCase getRecipesUseCase;
  final SearchRecipeUseCase searchRecipeUseCase;

  SearchViewModel({
    required this.getRecipesUseCase,
    required this.searchRecipeUseCase,
  }) {
    fetchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await getRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(isLoading: false, recipes: result.data);
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  void search(String value) async {
    final result = await searchRecipeUseCase.execute(value);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipes: result.data);
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }
}
