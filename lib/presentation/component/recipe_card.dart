import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;


  const RecipeCard({super.key, required this.recipe,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeIngredientScreen(recipe: recipe)),
          );

      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
            child: AspectRatio(
              aspectRatio: 21 / 10,
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
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
            child: AspectRatio(
                aspectRatio: 21 / 10,
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
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      recipe.name,
                      style: TextStyles.smallTextBold
                          .copyWith(color: Colors.white),
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
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0),
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
                          style: TextStyles.smallerTextRegular
                              .copyWith(fontSize: 8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 10.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.timer_sharp,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Text(
                    recipe.time,
                    style: TextStyles.smallerTextRegular.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/book_mark_icon.png',
                            width: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
