import 'package:food_recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';

class MockProcedureDataSource implements ProcedureDataSource {
  final _data = [
    // Recipe 1: Traditional spare ribs baked
    const Procedure(
      recipeId: 1,
      step: 1,
      content: 'Preheat the oven to 350°F (175°C).',
    ),
    const Procedure(
      recipeId: 1,
      step: 2,
      content:
          'Remove the membrane from the back of the ribs if it is still attached.',
    ),
    const Procedure(
      recipeId: 1,
      step: 3,
      content:
          'Season the ribs generously with salt, pepper, and your favorite rub.',
    ),
    const Procedure(
      recipeId: 1,
      step: 4,
      content: 'Wrap the ribs tightly in aluminum foil to retain moisture.',
    ),
    const Procedure(
      recipeId: 1,
      step: 5,
      content:
          'Place the wrapped ribs on a baking sheet and bake in the preheated oven for 2 hours.',
    ),
    const Procedure(
      recipeId: 1,
      step: 6,
      content: 'Remove the ribs from the oven and carefully unwrap them.',
    ),
    const Procedure(
      recipeId: 1,
      step: 7,
      content: 'Brush the ribs with your favorite barbecue sauce.',
    ),
    const Procedure(
      recipeId: 1,
      step: 8,
      content:
          'Return the ribs to the oven, uncovered, and bake for an additional 30 minutes, or until the sauce has caramelized.',
    ),

    // Recipe 2: Spice roasted chicken with flavored rice
    const Procedure(
      recipeId: 2,
      step: 1,
      content:
          'Marinate the chicken with spices and let it sit for 30 minutes.',
    ),
    const Procedure(
      recipeId: 2,
      step: 2,
      content:
          'Preheat the oven to 375°F (190°C) and roast the chicken for 45 minutes.',
    ),
    const Procedure(
      recipeId: 2,
      step: 3,
      content:
          'Cook the rice with chicken broth and add vegetables for flavor.',
    ),

    // Recipe 3: Spicy fried rice mix chicken bali
    const Procedure(
      recipeId: 3,
      step: 1,
      content: 'Cook the rice and let it cool.',
    ),
    const Procedure(
      recipeId: 3,
      step: 2,
      content: 'Stir-fry chicken with spices until cooked through.',
    ),
    const Procedure(
      recipeId: 3,
      step: 3,
      content:
          'Mix the chicken with the rice and vegetables, stir-fry for another 5 minutes.',
    ),

    // Recipe 4: Ttekbokki
    const Procedure(
      recipeId: 4,
      step: 1,
      content: 'Soak rice cakes in water for 20 minutes.',
    ),
    const Procedure(
      recipeId: 4,
      step: 2,
      content: 'Boil water and add gochujang (Korean red chili paste).',
    ),
    const Procedure(
      recipeId: 4,
      step: 3,
      content: 'Add rice cakes and fish cakes, cook until the sauce thickens.',
    ),
  ];

  @override
  Future<List<Procedure>> getProcedures() async {
    return _data;
  }
}
