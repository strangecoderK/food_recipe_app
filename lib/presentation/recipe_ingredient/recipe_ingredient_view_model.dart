import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/use_case/copy_link_use_case.dart';
import 'package:food_recipe_app/presentation/component/pop_up_dialog.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_state.dart';
import 'package:go_router/go_router.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository recipeRepository;
  final ProcedureRepository procedureRepository;
  final ProfileRepository profileRepository;
  final CopyLinkUseCase copyLinkUseCase;

  RecipeIngredientViewModel({
    required this.recipeRepository,
    required this.procedureRepository,
    required this.profileRepository,
    required this.copyLinkUseCase,
  });

  RecipeIngredientState _state = const RecipeIngredientState();

  RecipeIngredientState get state => _state;

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

  void showCustomDialog(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            child: PopUpDialog(
              url: image,
              callback: () {
                copyLink(image);
                context.pop();
              },
            ));
      },
    );
  }

  void copyLink(String text) {
    copyLinkUseCase.execute(text);
  }
}
