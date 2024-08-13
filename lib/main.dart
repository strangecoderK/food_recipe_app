import 'package:flutter/material.dart';
import 'package:food_recipe_app/di/di_setup.dart';
import 'package:food_recipe_app/router/router.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
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
       );
  }
}
