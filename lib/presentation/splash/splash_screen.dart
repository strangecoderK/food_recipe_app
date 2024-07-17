import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/medium_button.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 104,
                ),
                child: Image.asset('assets/images/chef.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  '100K+ Premium Recipe',
                  style:
                      TextStyles.mediumTextBold.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 222,
              ),
              Text(
                'Get',
                style: TextStyles.titleTextBold.copyWith(color: Colors.white),
              ),
              Text(
                'Cooking',
                style: TextStyles.titleTextBold.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Simple way to find Tasty Recipe',
                style:
                    TextStyles.normalTextRegular.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 64,
              ),
              const MediumButton(
                text: 'start cooking',
                path: '/',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
