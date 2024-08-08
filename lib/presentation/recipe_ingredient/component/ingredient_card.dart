import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe_ingredient.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import 'package:food_recipe_app/ui/text_styles.dart';

class IngredientCard extends StatelessWidget {
  final RecipeIngredient recipeIngredient;

  const IngredientCard({
    super.key,
    required this.recipeIngredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.gray4,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(recipeIngredient.ingredient.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  recipeIngredient.ingredient.name,
                  style: TextStyles.normalTextBold,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 27.0),
                child: Text(
                  '${recipeIngredient.amount}g',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
