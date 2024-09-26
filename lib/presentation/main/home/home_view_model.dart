import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/model/user.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/presentation/main/home/home_state.dart';
import 'package:food_recipe_app/ui/search_category_event.dart';

class HomeViewModel with ChangeNotifier {
  final User _user;
  final GetRecipesUseCase _getRecipesUseCase;
  final _eventController = StreamController<SelectCategoryEvent>();

  HomeViewModel({
    required User user,
    required GetRecipesUseCase getRecipesUseCase,
  })  : _user = user,
        _getRecipesUseCase = getRecipesUseCase;

  User get user => _user;

  HomeState _state = const HomeState();

  HomeState get state => _state;

  Stream<SelectCategoryEvent> get eventStream => _eventController.stream;

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void updateTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  // Future<void> getRecipes() async {
  //   final result = await _getRecipesUseCase.execute();
  //   switch (result) {
  //     case Success<List<Recipe>>():
  //       _state = state.copyWith(recipes: result.data);
  //       notifyListeners();
  //     case Error<List<Recipe>>():
  //     // TODO: Handle this case.
  //   }
  // }

  Future<void> getSelectedRecipes(String value) async {
    final result = await _getRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        if (state.selectedCategory == 'All') {
          _state = state.copyWith(selectedRecipes: result.data);
          notifyListeners();
        } else {
          _state = state.copyWith(
              selectedRecipes: result.data
                  .where((e) => e.category == state.selectedCategory)
                  .toList());
          notifyListeners();
        }

      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  Future<void> getCategories() async {
    final result = await _getRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
            categories: result.data.map((e) => e.category).toSet().toList());
        notifyListeners();
      case Error<List<Recipe>>():
      // TODO: Handle this case.
    }
  }

  void selectCategory(int index) async {
    _state = state.copyWith(
        selectedCategory: index == 0 ? 'All' : _state.categories[index - 1]);
    onSelectedCategory(state.selectedCategory);
    notifyListeners();
  }

  void onSelectedCategory(String category) async {
    _eventController.add(SelectCategoryEvent.showCategory(category));
  }
}
