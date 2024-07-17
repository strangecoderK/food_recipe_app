import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/recipe_picture.dart';
import 'package:go_router/go_router.dart';

class RecipeIngredientScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeIngredientScreen({super.key, required this.recipe});

  @override
  State<RecipeIngredientScreen> createState() => _RecipeIngredientScreenState();
}

class _RecipeIngredientScreenState extends State<RecipeIngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 54.0,
            left: 20.0,
            right: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
        RecipePicture(recipe: widget.recipe),
      ],
    ));
  }
}
