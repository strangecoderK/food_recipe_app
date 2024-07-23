import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/change_notifier_provider.dart';
import 'package:food_recipe_app/presentation/component/search.dart';
import 'package:food_recipe_app/presentation/search/component/search_image.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvider.of<SearchViewModel>(context).value;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(
            hintText: 'Search recipe',
            function: viewModel.search,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 20.0),
            child: Text(
              'Recent search',
              style: TextStyles.normalTextBold,
            ),
          ),
          ListenableBuilder(
              listenable: viewModel,
              builder: (BuildContext context, Widget? child) {
                final recipes = viewModel.recipes;
                return viewModel.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15),
                              itemCount: recipes.length,
                              itemBuilder: (context, index) {
                                return SearchImage(recipe: recipes[index]);
                              }),
                        ),
                      );
              })
        ],
      ),
    );
  }
}
