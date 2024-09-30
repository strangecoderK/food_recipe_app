import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/category_tab_bar.dart';
import 'package:food_recipe_app/presentation/component/home_recipe_card.dart';
import 'package:food_recipe_app/presentation/component/new_recipe_card.dart';
import 'package:food_recipe_app/presentation/component/small_box.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/search/component/text_field_for_move.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/search_category_event.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool notInitialized = true;
  StreamSubscription<SelectCategoryEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<HomeViewModel>();
      _loadCategories();

      _subscription = viewModel.eventStream.listen((event) {
        switch (event) {
          case ShowCategory():
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(viewModel.state.selectedCategory),
              duration: const Duration(milliseconds: 1000),
            ));
        }
      });
    });
  }

  Future<void> _loadCategories() async {
    final viewModel = context.read<HomeViewModel>();
    final state = viewModel.state;
    await viewModel.getCategories();
    await viewModel.getSelectedRecipes(state.selectedCategory);
    await viewModel.getNewRecipes();
    _initTabController();
  }

  void _initTabController() {
    final viewModel = context.read<HomeViewModel>();
    _tabController = TabController(
      length: viewModel.state.categories.length + 1,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    setState(() {
      notInitialized = false;
    });
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      final viewModel = context.read<HomeViewModel>();
      viewModel.updateTab(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 70, right: 30.0, bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${viewModel.user.name}',
                    style: TextStyles.largeTextBold,
                  ),
                  Text(
                    'what are you cooking today?',
                    style: TextStyles.smallerTextBold
                        .copyWith(color: ColorStyles.gray4),
                  )
                ],
              ),
              SmallBox(image: viewModel.user.image)
            ],
          ),
        ),
        const TextFieldForMove(
            hintText: 'Search recipe', path: '/search_screen'),
        notInitialized
            ? const Center(child: CircularProgressIndicator())
            : CategoryTabBar(
                tabController: _tabController,
                categories: state.categories,
                callBack: (index) {
                  viewModel.selectCategory(index);
                  viewModel.getSelectedRecipes(state.selectedCategory);
                },
              ),
        // HomeRecipeCard(recipe: recipe)
        SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 22.5, right: 22.5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final recipes = state.selectedRecipes;
                return HomeRecipeCard(
                  recipe: recipes[index],
                  onTap: () {
                    context.push('/recipe_ingredient_screen',
                        extra: recipes[index]);
                  },
                );
              },
              itemCount: state.selectedRecipes.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
          child: Text(
            'New Recipes',
            style: TextStyles.normalTextBold,
          ),
        ),
        SizedBox(
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(left: 22.5, right: 22.5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final recipes = state.newRecipes;
                return NewRecipeCard(
                  recipe: recipes[index],
                  onTap: () {
                    context.push('/recipe_ingredient_screen',
                        extra: recipes[index]);
                  },
                );
              },
              itemCount: state.newRecipes.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
