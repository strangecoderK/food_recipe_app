import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/data_source/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surface: Colors.white,
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(
        repository:
            RecipeRepositoryImpl(recipeDataSource: MockRecipeDataSource()),
      ),
    );
  }
}
