import 'package:food_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

class MockRecipeDataSource implements RecipeDataSource {
  final _data = [
    // 기존 레시피
    Recipe(
      name: 'Traditional spare ribs baked',
      image:
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      chef: 'Chef John',
      time: '20 min',
      rating: 4.0,
    ),
    Recipe(
      name: 'Spice roasted chicken with flavored rice',
      image:
          'https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg',
      chef: 'Mark Kelvin',
      time: '20 min',
      rating: 4.0,
    ),
    Recipe(
      name: 'Spicy fried rice mix chicken bali',
      image:
          'https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg',
      chef: 'Spicy Nelly',
      time: '20 min',
      rating: 4.0,
    ),
    Recipe(
      name: 'Ttekbokki',
      image:
          'https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_1280.jpg',
      chef: 'Kim Dahee',
      time: '30 min',
      rating: 5.0,
    ),
    // 새 레시피
    Recipe(
      name: 'Grilled salmon with avocado salsa',
      image:
          'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg',
      chef: 'Alice Johnson',
      time: '25 min',
      rating: 4.5,
    ),
    Recipe(
      name: 'Beef Wellington',
      image:
          'https://cdn.pixabay.com/photo/2019/10/22/10/11/beef-wellington-4568239_1280.jpg',
      chef: 'Gordon Ramsay',
      time: '45 min',
      rating: 5.0,
    ),
    Recipe(
      name: 'Classic Margherita Pizza',
      image:
          'https://cdn.pixabay.com/photo/2019/05/15/18/56/pizza-4205701_1280.jpg',
      chef: 'Mario Batali',
      time: '15 min',
      rating: 4.3,
    ),
    Recipe(
      name: 'Sushi Platter',
      image:
          'https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg',
      chef: 'Jiro Ono',
      time: '60 min',
      rating: 4.8,
    ),
    Recipe(
      name: 'French Onion Soup',
      image:
          'https://cdn.pixabay.com/photo/2016/03/03/16/19/food-1234483_1280.jpg',
      chef: 'Julia Child',
      time: '40 min',
      rating: 4.6,
    ),
    Recipe(
      name: 'Chocolate Lava Cake',
      image:
          'https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_1280.jpg',
      chef: 'Paul Hollywood',
      time: '30 min',
      rating: 4.9,
    ),
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return _data;
  }
}
