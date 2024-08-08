import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_state.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository recipeRepository;
  final IngredientRepository ingredientRepository;
  final ProcedureRepository procedureRepository;
  final ProfileRepository profileRepository;

  RecipeIngredientViewModel({
    required this.profileRepository,
    required this.recipeRepository,
    required this.ingredientRepository,
    required this.procedureRepository,
  });

  RecipeIngredientState _state = const RecipeIngredientState();

  RecipeIngredientState get state => _state;

  //추후 다른 방식으로 state에 분리해야 될 것으로 보임

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  Set<Profile> _followingSet = {};

  Set<Profile> get followingSet => _followingSet;

  Future<void> initProfile(Recipe recipe) async {
    await getProfile(recipe.chef);
    await getProcedures(recipe.id);
  }

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
