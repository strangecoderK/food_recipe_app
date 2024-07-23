import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: ColorStyles.gray4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: ColorStyles.primary80),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray4)),
            ),
          )
        ],
      ),
    );
  }
}
