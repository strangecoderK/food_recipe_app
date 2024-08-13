import 'package:food_recipe_app/di/di_setup.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/presentation/search/search_screen.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
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
      path: '/main_screen',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/recipe_ingredient_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<RecipeIngredientViewModel>(
            create: (context) => getIt(),
            child: RecipeIngredientScreen(recipe: recipe));
      },
    ),
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/search_screen',
      builder: (context, state) {
        return ChangeNotifierProvider<SearchViewModel>(
            create: (context) => getIt(), child: const SearchScreen());
      },
    ),
  ],
);
