import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/chef_profile.dart';
import 'package:food_recipe_app/presentation/component/recipe_picture.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/component/ingredient_card.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/component/procedure_card.dart';
import 'package:food_recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecipeIngredientScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeIngredientScreen({super.key, required this.recipe});

  @override
  State<RecipeIngredientScreen> createState() => _RecipeIngredientScreenState();
}

class _RecipeIngredientScreenState extends State<RecipeIngredientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final RecipeIngredientViewModel viewModel =
          context.read<RecipeIngredientViewModel>();
      await viewModel.initProfile(widget.recipe);
    });
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      final viewModel = context.read<RecipeIngredientViewModel>();
      viewModel.updateTab(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeIngredientViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 54.0,
              left: 20.0,
              right: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                  padding: EdgeInsets.zero,
                ),
                PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            viewModel.showCustomDialog(
                                context, widget.recipe.image);
                          },
                          value: widget.recipe.image,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/images/share.png',
                                  width: 20,
                                ),
                              ),
                              const Text('share'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/images/star.png',
                                  width: 20,
                                ),
                              ),
                              const Text('Rate Recipe'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/images/review.png',
                                  width: 20,
                                ),
                              ),
                              const Text('Review'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/images/unsave.png',
                                  width: 20,
                                ),
                              ),
                              const Text('Unsave'),
                            ],
                          ),
                        ),
                      ];
                    })
              ],
            ),
          ),
          RecipePicture(recipe: widget.recipe),
          if (state.chef != null)
            ChefProfile(
              profile: state.chef!,
              onTap: (profile) {
                viewModel.changeFollow(profile);
              },
              isFollowing: viewModel.followingSet.contains(state.chef),
            )
          else
            const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Padding(
                  padding: EdgeInsets.only(
                      top: 13.0, bottom: 13.0, right: 45.0, left: 45.0),
                  child: Text('Ingredient', style: TextStyles.smallerTextBold),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 13.0, bottom: 13.0, right: 45.0, left: 45.0),
                  child: Text('Procedure', style: TextStyles.smallerTextBold),
                ),
              ],
              // TabBar 스타일 지정
              labelColor: ColorStyles.white,
              unselectedLabelColor: ColorStyles.primary100,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                color: ColorStyles.primary100, // 선택된 탭 배경색
                borderRadius: BorderRadius.circular(15),
                // 선택된 탭 모서리 둥글게
              ),
              dividerColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, bottom: 15.0, top: 14.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/dish_icon.png',
                  width: 17,
                ),
                Text(
                  '1 serve',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                ),
                const Spacer(),
                Text(
                  viewModel.currentTabIndex == 0
                      ? '${widget.recipe.ingredients.length} items'
                      : '${state.procedureList.length} steps',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                    padding: EdgeInsets.zero,
                    children: widget.recipe.ingredients
                        .map((e) => IngredientCard(recipeIngredient: e))
                        .toList()),
                ListView(
                    padding: EdgeInsets.zero,
                    children: state.procedureList
                        .map((e) => ProcedureCard(procedure: e))
                        .toList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
