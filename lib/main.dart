import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/sign_in/sign_in_screen.dart';

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
        // scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surface: Colors.white,
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
