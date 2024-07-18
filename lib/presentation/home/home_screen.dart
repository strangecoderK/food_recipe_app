import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:food_recipe_app/presentation/home/saved_recipe_view.dart';

class HomeScreen extends StatefulWidget {
  final RecipeRepository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 1;
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
      const Center(child: Text('Home')),
      SavedRecipeView(
        repository: widget.repository,
      ),
      const Center(child: Text('Notifications')),
      const Center(child: Text('Profile')),
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
