import 'package:food_recipe_app/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/profile/mock_profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/saved_recipe/mock_saved_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/saved_recipe/saved_recipe_data_source.dart';
import 'package:food_recipe_app/data/repository/ingredient/ingredient_repository_impl.dart';
import 'package:food_recipe_app/data/repository/procedure/procedure_repository_impl.dart';
import 'package:food_recipe_app/data/repository/profile/profile_repository_impl.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository_impl.dart';
import 'package:food_recipe_app/domain/model/user.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/repository/saved_recipe_repository.dart';
import 'package:food_recipe_app/domain/use_case/copy_link_use_case.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/search_recipe_use_case.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<IngredientDataSource>(MockIngredientDataSource());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSource());
  getIt.registerSingleton<ProfileDataSource>(MockProfileDataSource());
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSource());
  getIt.registerSingleton<SavedRecipeDataSource>(MockSavedRecipeDataSource());

  getIt.registerSingleton<IngredientRepository>(
      IngredientRepositoryImpl(datasource: getIt()));
  getIt.registerSingleton<ProcedureRepository>(
      ProcedureRepositoryImpl(dataSource: getIt()));
  getIt.registerSingleton<ProfileRepository>(
      ProfileRepositoryImpl(dataSource: getIt()));
  getIt.registerSingleton<RecipeRepository>(
      RecipeRepositoryImpl(dataSource: getIt()));
  getIt.registerSingleton<SavedRecipeRepository>(
      SavedRecipeRepositoryImpl(dataSource: getIt()));

  getIt.registerSingleton<GetRecipesUseCase>(
      GetRecipesUseCase(repository: getIt()));
  getIt.registerSingleton<SearchRecipeUseCase>(
      SearchRecipeUseCase(repository: getIt()));
  getIt.registerSingleton<CopyLinkUseCase>(CopyLinkUseCase());

  getIt.registerFactory(() => HomeViewModel(
      user: const User(
          id: 1,
          name: 'StrangeCoder',
          email: 'dh90502@gmail.com',
          image:
              'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png'),
      getRecipesUseCase: getIt()));
  getIt.registerFactory(() => SavedRecipeViewModel(getIt()));
  getIt.registerFactory(() => RecipeIngredientViewModel(
      copyLinkUseCase: getIt(),
      profileRepository: getIt(),
      recipeRepository: getIt(),
      procedureRepository: getIt()));
  getIt.registerFactory(() => SearchViewModel(
      getRecipesUseCase: getIt(), searchRecipeUseCase: getIt()));
}
