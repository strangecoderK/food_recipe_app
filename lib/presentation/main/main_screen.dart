import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/change_notifier_provider.dart';
import 'package:food_recipe_app/data/data_source/saved_recipe/mock_saved_recipe_data_source.dart';

import 'package:food_recipe_app/data/model/user.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository.dart';
import 'package:food_recipe_app/data/repository/saved_recipe/saved_recipe_repository_impl.dart';

import 'package:food_recipe_app/presentation/main/home/home_screen.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/main/notification/notification_screen.dart';
import 'package:food_recipe_app/presentation/main/profile/profile_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';

class MainScreen extends StatefulWidget {
  final SavedRecipeRepository repository;

  const MainScreen({super.key, required this.repository});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  late final List<Widget> _screen;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  final User user = const User(
      id: 1,
      name: 'StrangeCoder',
      email: 'dh90502@gmail.com',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png');

  final destination = [
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_home.png'),
        selectedIcon: Image.asset(
          'assets/images/selected_home.png',
        ),
        label: 'home'),
    NavigationDestination(
      icon: Image.asset('assets/images/unselected_book_mark.png'),
      selectedIcon: Image.asset('assets/images/selected_book_mark.png'),
      label: 'saved',
    ),
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_alert.png'),
        selectedIcon: Image.asset('assets/images/selected_alert.png'),
        label: 'notifications'),
    NavigationDestination(
        icon: Image.asset('assets/images/unselected_man.png'),
        selectedIcon: Image.asset('assets/images/selected_man.png'),
        label: 'profile')
  ];

  @override
  void initState() {
    _screen = [
      HomeScreen(HomeViewModel(user)),
      ChangeNotifierProvider<SavedRecipeViewModel>(
          value: SavedRecipeViewModel(SavedRecipeRepositoryImpl(
              recipeDataSource: MockSavedRecipeDataSource())),
          child: const SavedRecipeScreen()),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 58,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        destinations: destination,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
