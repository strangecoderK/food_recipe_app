import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class ProcedureCard extends StatelessWidget {
  final Procedure procedure;

  const ProcedureCard({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
      child: Container(
          decoration: const BoxDecoration(
              color: ColorStyles.gray4,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step ${procedure.step}',
                  style: TextStyles.smallerTextBold,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  procedure.content,
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                )
              ],
            ),
          )),
    );
  }
}
