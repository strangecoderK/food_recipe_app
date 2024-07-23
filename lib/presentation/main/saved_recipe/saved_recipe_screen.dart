import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/change_notifier_provider.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        ChangeNotifierProvider.of<SavedRecipeViewModel>(context).value;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0, bottom: 10),
            child: Text(
              'Saved recipes',
              style: TextStyles.mediumTextBold,
            ),
          ),
        ),
        ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            final recipes = viewModel.recipes;
            return viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children:
                          recipes.map((e) => RecipeCard(recipe: e)).toList(),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
