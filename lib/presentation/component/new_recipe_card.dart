import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const NewRecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 7.5, right: 7.5),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 4),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, -4),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(4, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(-4, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipe.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.smallTextBold,
                        ),
                        Text(
                          'By ${recipe.chef}',
                          style: TextStyles.smallerTextRegular
                              .copyWith(color: ColorStyles.gray3),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    recipe.time,
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray3),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -40,
              right: 10,
              child: ClipOval(
                child: Image.network(
                  recipe.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
