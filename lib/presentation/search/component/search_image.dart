import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SearchImage extends StatelessWidget {
  final Recipe recipe;

  const SearchImage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            )),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  recipe.name,
                  style:
                      TextStyles.smallerTextBold.copyWith(color: Colors.white),
                ),
              ),
              Text('By ${recipe.chef}',
                  style: TextStyles.smallerTextRegular.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 8)),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorStyles.secondary20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: ColorStyles.rating,
                    size: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      recipe.rating.toString(),
                      style:
                          TextStyles.smallerTextRegular.copyWith(fontSize: 8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
