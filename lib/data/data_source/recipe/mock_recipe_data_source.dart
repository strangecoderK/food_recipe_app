import 'package:food_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/model/recipe_ingredient.dart';

class MockRecipeDataSource implements RecipeDataSource {
  final _data = [
    const Recipe(
      id: 1,
      name: 'Traditional spare ribs baked',
      image:
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      chef: 'Chef John',
      time: '20 min',
      rating: 4.0,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 3,
            name: 'Pork',
            image:
                'https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg',
          ),
          amount: 500,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 9,
            name: 'Onion',
            image:
                'https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg',
          ),
          amount: 50,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 8,
            name: 'Pepper',
            image:
                'https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg',
          ),
          amount: 10,
        ),  RecipeIngredient(
          ingredient: Ingredient(
            id: 1,
            name: 'Tomato',
            image:
            'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
          ),
          amount: 100,
        ),
      ],
    ),
    const Recipe(
      id: 2,
      name: 'Spice roasted chicken with flavored rice',
      image:
          'https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg',
      chef: 'Mark Kelvin',
      time: '20 min',
      rating: 4.0,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 6,
            name: 'Chicken',
            image:
                'https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg',
          ),
          amount: 300,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 4,
            name: 'Rice',
            image:
                'https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg',
          ),
          amount: 200,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 8,
            name: 'Pepper',
            image:
                'https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg',
          ),
          amount: 5,
        ),  RecipeIngredient(
          ingredient: Ingredient(
            id: 3,
            name: 'Pork',
            image:
            'https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg',
          ),
          amount: 500,
        ),
      ],
    ),
    const Recipe(
      id: 3,
      name: 'Spicy fried rice mix chicken bali',
      image:
          'https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg',
      chef: 'Spicy Nelly',
      time: '20 min',
      rating: 4.0,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 6,
            name: 'Chicken',
            image:
                'https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg',
          ),
          amount: 200,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 4,
            name: 'Rice',
            image:
                'https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg',
          ),
          amount: 150,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 1,
            name: 'Tomato',
            image:
                'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
          ),
          amount: 100,
        ),
      ],
    ),
    const Recipe(
      id: 4,
      name: 'Ttekbokki',
      image:
          'https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_1280.jpg',
      chef: 'Kim Dahee',
      time: '30 min',
      rating: 5.0,
      ingredients: [],
    ),
    const Recipe(
      id: 5,
      name: 'Grilled salmon with avocado salsa',
      image:
          'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg',
      chef: 'Alice Johnson',
      time: '25 min',
      rating: 4.5,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 5,
            name: 'Avocado',
            image:
                'https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg',
          ),
          amount: 150,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 8,
            name: 'Pepper',
            image:
                'https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg',
          ),
          amount: 5,
        ),
      ],
    ),
    const Recipe(
      id: 6,
      name: 'Beef Wellington',
      image:
          'https://cdn.pixabay.com/photo/2019/10/22/10/11/beef-wellington-4568239_1280.jpg',
      chef: 'Gordon Ramsay',
      time: '45 min',
      rating: 5.0,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 2,
            name: 'Beef',
            image:
                'https://cdn.pixabay.com/photo/2016/01/21/18/08/meet-1154341_1280.png',
          ),
          amount: 500,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 9,
            name: 'Onion',
            image:
                'https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg',
          ),
          amount: 100,
        ),
      ],
    ),
    const Recipe(
      id: 7,
      name: 'Classic Margherita Pizza',
      image:
          'https://cdn.pixabay.com/photo/2019/05/15/18/56/pizza-4205701_1280.jpg',
      chef: 'Mario Batali',
      time: '15 min',
      rating: 4.3,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 1,
            name: 'Tomato',
            image:
                'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
          ),
          amount: 200,
        ),
      ],
    ),
    const Recipe(
      id: 8,
      name: 'Sushi Platter',
      image:
          'https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg',
      chef: 'Jiro Ono',
      time: '60 min',
      rating: 4.8,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 6,
            name: 'Chicken',
            image:
                'https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg',
          ),
          amount: 200,
        ),
        RecipeIngredient(
          ingredient: Ingredient(
            id: 4,
            name: 'Rice',
            image:
                'https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg',
          ),
          amount: 100,
        ),
      ],
    ),
    const Recipe(
      id: 9,
      name: 'French Onion Soup',
      image:
          'https://cdn.pixabay.com/photo/2016/03/03/16/19/food-1234483_1280.jpg',
      chef: 'Julia Child',
      time: '40 min',
      rating: 4.6,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 9,
            name: 'Onion',
            image:
                'https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg',
          ),
          amount: 300,
        ),
      ],
    ),
    const Recipe(
      id: 10,
      name: 'Chocolate Lava Cake',
      image:
          'https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_1280.jpg',
      chef: 'Paul Hollywood',
      time: '30 min',
      rating: 4.9,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(
            id: 7,
            name: 'Sugar',
            image:
                'https://cdn.pixabay.com/photo/2014/11/28/19/10/lump-sugar-549096_1280.jpg',
          ),
          amount: 100,
        ),
      ],
    ),
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return _data;
  }
}
