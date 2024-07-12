import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/presentation/component/icon_box.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 94),
            child: Text(
              'Hello,',
              style: TextStyles.headerTextBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 32),
            child: Text(
              'Welcome Back!',
              style: TextStyles.largeTextRegular,
            ),
          ),
          InputField(
            title: 'Email',
            hintText: 'Enter Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 5,
          ),
          InputField(
            title: 'Enter Password',
            hintText: 'Enter Password',
            controller: passwordController,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // 패딩 제거
                minimumSize: const Size(0, 0), // 최소 크기 제거
                tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 탭 타겟 크기 축소
              ),
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyles.smallerTextRegular
                    .copyWith(color: ColorStyles.secondary100),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const BigButton(text: 'Sign in'),
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
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyles.smallerTextRegular
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.secondary100,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
