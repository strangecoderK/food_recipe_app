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

  Future<void> _initProfile() async {
    await getProfile(recipe.chef);
    await getProcedures(recipe.id);
  }

  List<Procedure> _procedureList = [];

  Profile _chef = const Profile(
    id: 0,
    name: 'name',
    image:
        'https://cdn.pixabay.com/photo/2018/11/03/15/51/here-3792307_1280.png',
    address: 'address',
  );
  Set<Profile> _followingSet = {};
  int _currentTabIndex = 0;
  late String _currentTabText = '${recipe.ingredients.length} items';

  List<Procedure> get procedureList => _procedureList;

  int get currentTabIndex => _currentTabIndex;

  String get currentTabText => _currentTabText;

  Profile get chef => _chef;

  Set<Profile> get followingSet => _followingSet;

  void updateTab(int index) {
    _currentTabIndex = index;
    _currentTabText = index == 0
        ? '${recipe.ingredients.length} items'
        : '${procedureList.length} steps';
    notifyListeners();
  }

  Future<void> getProcedures(int recipeId) async {
    final result = await procedureRepository.getProcedures();
    switch (result) {
      case Success<List<Procedure>>():
        _procedureList = result.data
            .where((e) => e.recipeId == recipeId)
            .sorted((a, b) => a.step.compareTo(b.step));
        notifyListeners();
      case Error<List<Procedure>>():
    }
  }

  Future<void> getProfile(String name) async {
    final result = await profileRepository.getProfiles();
    switch (result) {
      case Success<List<Profile>>():
        _chef = result.data.firstWhere((e) => e.name == name);
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
