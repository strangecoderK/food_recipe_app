import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/category_tab_bar.dart';
import 'package:food_recipe_app/presentation/component/small_box.dart';
import 'package:food_recipe_app/presentation/main/home/home_view_model.dart';
import 'package:food_recipe_app/presentation/search/component/text_field_for_move.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/search_category_event.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
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
    await viewModel.getCategories();
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
                callBack: viewModel.selectCategory,
              ),
      ],
    );
  }
}
