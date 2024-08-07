import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SavedRecipeViewModel>();
    final state = viewModel.state;
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 70.0, bottom: 10),
            child: Text(
              'Saved recipes',
              style: TextStyles.mediumTextBold,
            ),
          ),
        ),
        state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children:
                      state.recipes.map((e) => RecipeCard(recipe: e)).toList(),
                ),
              ),
      ],
    );
  }
}
