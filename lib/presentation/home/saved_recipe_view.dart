import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';

class SavedRecipeView extends StatelessWidget {
  final RecipeRepository repository;

  const SavedRecipeView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repository.getRecipes(),
        builder: (BuildContext context,
            AsyncSnapshot<Result<List<Recipe>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final result = snapshot.data!;
          switch (result) {
            case Success<List<Recipe>>():
              return ListView(
                  children:
                      result.data.map((e) => RecipeCard(recipe: e)).toList());
            case Error<List<Recipe>>():
              return Text(result.e);
          }
        });
  }
}
