import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class CategoryTabBar extends StatelessWidget {
  final TabController _tabController;
  final List<String> _categories;
  final void Function(int index) callBack;

  const CategoryTabBar({
    super.key,
    required TabController tabController,
    required List<String> categories,
    required this.callBack,
  })  : _tabController = tabController,
        _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TabBar(
        onTap: callBack,
        tabAlignment: TabAlignment.start,
        controller: _tabController,
        tabs: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('all'),
          ),
          ..._categories.map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e,
                  style: TextStyles.smallerTextBold,
                ),
              ))
        ],

        // 전체 탭 바의 수평 패딩 조정
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
        isScrollable: true,
        labelColor: ColorStyles.white,
        unselectedLabelColor: ColorStyles.primary100,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: ColorStyles.primary100, // 선택된 탭 배경색
          borderRadius: BorderRadius.circular(15),
          // 선택된 탭 모서리 둥글게
        ),
        dividerColor: Colors.transparent,
      ),
    );
  }
}
