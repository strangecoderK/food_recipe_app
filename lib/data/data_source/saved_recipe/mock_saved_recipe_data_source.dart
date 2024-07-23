import 'package:food_recipe_app/data/data_source/saved_recipe/saved_recipe_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

class MockSavedRecipeDataSource implements SavedRecipeDataSource {
  final _data = [
    const Recipe(
      id: 1,
      name: 'Traditional spare ribs baked',
      image:
          'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
      chef: 'Chef John',
      time: '20 min',
      rating: 4.0,
    ),
    const Recipe(
      id: 2,
      name: 'spice roasted chicken with flavored rice',
      image:
          'https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg',
      chef: 'Mark Kelvin',
      time: '20 min',
      rating: 4.0,
    ),
    const Recipe(
      id: 3,
      name: 'Spicy fried rice mix chicken bali',
      image:
          'https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg',
      chef: 'Spicy Nelly',
      time: '20 min',
      rating: 4.0,
    ),
    const Recipe(
      id: 4,
      name: 'Ttekbokki',
      image:
          'https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_1280.jpg',
      chef: 'Kim dahee',
      time: '30 min',
      rating: 5.0,
    )
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return _data;
  }
}
