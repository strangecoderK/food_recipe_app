import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class PopUpDialog extends StatelessWidget {
  final String url;
  final VoidCallback callback;

  const PopUpDialog({
    super.key,
    required this.url,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: context.pop,
          child: const Padding(
            padding: EdgeInsets.only(top: 15.0, right: 15.0),
            child: Icon(Icons.close, size: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15.0, bottom: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'Recipe Link',
                    style: TextStyles.largeTextBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text(
                    'Copy recipe link and share your recipe link with friends and family',
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray2),
                  ),
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  url,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyles.smallerTextRegular,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 12,
                          child: SizedBox(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 7,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: callback,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorStyles.primary100),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Center(
                                    child: Text(
                                      'Copy Link',
                                      style: TextStyles.smallerTextBold
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
