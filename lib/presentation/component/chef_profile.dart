import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class ChefProfile extends StatelessWidget {
  final Profile profile;
  final void Function(Profile profile) onTap;
  final bool isFollowing;

  const ChefProfile(
      {super.key,
      required this.profile,
      required this.onTap,
      required this.isFollowing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              profile.image,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.name, style: TextStyles.smallTextBold),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: ColorStyles.primary80,
                      size: 20,
                    ),
                    Text(
                      profile.address,
                      style: TextStyles.smallerTextRegular
                          .copyWith(color: ColorStyles.gray3),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => onTap(profile),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorStyles.primary100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 14.0, bottom: 14.0, left: 28.0, right: 28.0),
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style:
                      TextStyles.smallerTextBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
