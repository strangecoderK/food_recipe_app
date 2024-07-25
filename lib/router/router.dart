import 'package:food_recipe_app/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/profile/mock_profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/saved_recipe/mock_saved_recipe_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/ingredient/ingredient_repository_impl.dart';
import 'package:food_recipe_app/data/repository/procedure/procedure_repository_impl.dart';
import 'package:food_recipe_app/data/repository/profile/profile_repository_impl.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository_impl.dart';
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
      builder: (context, state) => MainScreen(
        repository: SavedRecipeRepositoryImpl(
          recipeDataSource: MockSavedRecipeDataSource(),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_ingredient_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<RecipeIngredientViewModel>(
            create:(context)=> RecipeIngredientViewModel(recipe,
                profileRepository:
                    ProfileRepositoryImpl(dataSource: MockProfileDataSource()),
                recipeRepository: RecipeRepositoryImpl(
                    recipeDataSource: MockRecipeDataSource()),
                ingredientRepository: IngredientRepositoryImpl(
                    datasource: MockIngredientDataSource()),
                procedureRepository: ProcedureRepositoryImpl(
                    dataSource: MockProcedureDataSource())),
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
            create:(context)=> SearchViewModel(
                repository: RecipeRepositoryImpl(
                    recipeDataSource: MockRecipeDataSource())),
            child: const SearchScreen());
      },
    ),
  ],
);
