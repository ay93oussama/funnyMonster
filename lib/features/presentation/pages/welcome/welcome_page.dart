import 'dart:math';

import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/features/presentation/pages/home/home_page.dart';
import 'package:show_up_animation/show_up_animation.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> bg = [
    Resources.bg_monster_1,
    Resources.bg_monster_2,
    Resources.bg_monster_3,
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(bg[random.nextInt(3)]),
        )),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowUpAnimation(
                    direction: Direction.horizontal,
                    offset: -0.3,
                    child: const Text(
                      'Learn from your favorite monster',
                      style: TextStyle(fontSize: 36, fontFamily: Fonts.paytoneOne, height: 1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ShowUpAnimation(
                    direction: Direction.horizontal,
                    offset: -0.3,
                    child: Text(
                      'Number, date or whatever you give us, we have information about it',
                      style: TextStyle(fontSize: 15, fontFamily: Fonts.averiaBold, color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildGetStartedButton()
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return ShowUpAnimation(
      animationDuration: const Duration(seconds: 1),
      direction: Direction.horizontal,
      offset: -0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: UIColors.green),
        child: const Text(
          'Get started',
          style: TextStyle(fontFamily: Fonts.gilroyBold, fontSize: 21, color: Colors.white),
        ),
        onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false),
      ),
    );
  }
}
