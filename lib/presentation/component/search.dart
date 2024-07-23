import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class Search extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? function;

  const Search({
    super.key,
    required this.hintText,
    this.controller,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              onChanged: function,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: ColorStyles.gray4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: ColorStyles.primary80),
                  ),
                  hintText: hintText,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorStyles.gray4,
                  ),
                  hintStyle: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyles.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/filter.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
