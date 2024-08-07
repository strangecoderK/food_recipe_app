import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/model/profile.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/ingredient/ingredient_repository.dart';
import 'package:food_recipe_app/data/repository/procedure/procedure_repository.dart';
import 'package:food_recipe_app/data/repository/profile/profile_repository.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_state.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final Recipe recipe;
  final RecipeRepository recipeRepository;
  final IngredientRepository ingredientRepository;
  final ProcedureRepository procedureRepository;
  final ProfileRepository profileRepository;

  RecipeIngredientViewModel(
    this.recipe, {
    required this.profileRepository,
    required this.recipeRepository,
    required this.ingredientRepository,
    required this.procedureRepository,
  }) {
    _initProfile();
  }

  RecipeIngredientState _state = const RecipeIngredientState();

  RecipeIngredientState get state => _state;

  Future<void> _initProfile() async {
    await getProfile(recipe.chef);
    await getProcedures(recipe.id);
  }

  //추후 다른 방식으로 state에 분리해야 될 것으로 보임
  Set<Profile> _followingSet = {};

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  String get currentTabText => _currentTabIndex == 0
      ? '${recipe.ingredients.length} items'
      : '${state.procedureList.length} steps';

  Set<Profile> get followingSet => _followingSet;

  void updateTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  Future<void> getProcedures(int recipeId) async {
    final result = await procedureRepository.getProcedures();
    switch (result) {
      case Success<List<Procedure>>():
        _state = state.copyWith(
            procedureList: result.data
                .where((e) => e.recipeId == recipeId)
                .sorted((a, b) => a.step.compareTo(b.step)));
        notifyListeners();
      case Error<List<Procedure>>():
    }
  }

  Future<void> getProfile(String name) async {
    final result = await profileRepository.getProfiles();
    switch (result) {
      case Success<List<Profile>>():
        _state =
            state.copyWith(chef: result.data.firstWhere((e) => e.name == name));
        notifyListeners();
      case Error<List<Profile>>():
    }
  }

  void changeFollow(Profile profile) {
    if (followingSet.contains(profile)) {
      followingSet.remove(profile);
    } else {
      followingSet.add(profile);
    }
    notifyListeners();
  }
}
