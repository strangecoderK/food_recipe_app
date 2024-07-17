import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SavedRecipeView extends StatelessWidget {
  final RecipeRepository repository;

  const SavedRecipeView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 54.0, bottom: 10),
            child: Text(
              'Saved recipes',
              style: TextStyles.mediumTextBold,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
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
                      padding: EdgeInsets.zero,
                      children: result.data
                          .map(
                            (e) => Hero(
                              tag: 'picture${e.name}',
                              child: RecipeCard(
                                recipe: e,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  case Error<List<Recipe>>():
                    return Text(result.e);
                }
              }),
        ),
      ],
    );
  }
}
