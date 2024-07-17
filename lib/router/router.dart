import 'package:food_recipe_app/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:food_recipe_app/presentation/home/home_screen.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:food_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      builder: (context, state) => HomeScreen(
        repository: RecipeRepositoryImpl(
          recipeDataSource: MockRecipeDataSource(),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_ingredient_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeIngredientScreen(
          recipe: recipe,
        );
      },
    ),
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
  ],
);
