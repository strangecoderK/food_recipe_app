import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/presentation/component/icon_box.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 54.0, left: 30.0),
            child: Text(
              'Create an account',
              style: TextStyles.largeTextBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Let's help you set up your account,",
              style: TextStyles.smallTextRegular
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
            child: Text(
              "it won't take long.",
              style: TextStyles.smallTextRegular
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          const InputField(
            title: 'Name',
            hintText: 'Enter Name',
          ),
          const InputField(
            title: 'Email',
            hintText: 'Enter Email',
          ),
          const InputField(
            title: 'Password',
            hintText: 'Enter Password',
          ),
          const InputField(
            title: 'Confirm Password',
            hintText: 'Retype Password',
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(
                      width: 1, color: ColorStyles.secondary100),
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: ColorStyles.secondary100,
                  checkColor: Colors.white,
                ),
              ),
              Text(
                'Accept terms & Condition',
                style: TextStyles.smallerTextRegular.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.secondary100),
              ),
            ],
          ),
          const BigButton(
            text: 'Sign Up',
            path: '/main_screen',
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 90, left: 90),
                  child: Divider(),
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        'Or Sign in With',
                        style: TextStyles.smallerTextRegular
                            .copyWith(color: ColorStyles.gray4),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconBox(iconImage: 'assets/images/google_image.png'),
              IconBox(iconImage: 'assets/images/face_book_image.png')
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyles.smallerTextRegular
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () => context.go('/'),
                    child: Text(
                      'Sign In',
                      style: TextStyles.smallerTextRegular.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.secondary100),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
