import 'package:flutter/material.dart';
import 'package:food_recipe_app/di/di_setup.dart';

import 'package:food_recipe_app/presentation/main/home/home_screen.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/main/notification/notification_screen.dart';
import 'package:food_recipe_app/presentation/main/profile/profile_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_screen.dart';
import 'package:food_recipe_app/presentation/main/saved_recipe/saved_recipe_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  late final List<Widget> _screen;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

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
      ChangeNotifierProvider<HomeViewModel>(
          create: (context) => getIt(), child: const HomeScreen()),
      ChangeNotifierProvider<SavedRecipeViewModel>(
          create: (context) => getIt(), child: const SavedRecipeScreen()),
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
