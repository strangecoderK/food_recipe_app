import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class HomeRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const HomeRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 7.5,
        right: 7.5,
        top: 70,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorStyles.gray4),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  recipe.name,
                  style: TextStyles.smallTextBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: -60,
            child: ClipOval(
              child: Image.network(
                recipe.image,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'time',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                ),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextBold,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
