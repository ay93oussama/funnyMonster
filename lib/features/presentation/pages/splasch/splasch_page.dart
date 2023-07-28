import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/features/presentation/pages/welcome/welcome_page.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildLogo(),
      body: _buildCenterText(context),
    );
  }

  Center _buildCenterText(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 18.0,
            fontFamily: Fonts.averiaRegular,
          ),
          child: AnimatedTextKit(
              repeatForever: false,
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                    'This application was created by Ayadi Oussama for testing by the ALTOW team, and I hope it will help you to better '
                    'understand my knowledge and experience in mobile development, and that you will enjoy playing with it.',
                    textAlign: TextAlign.center),
              ],
              onFinished: () => navigateTo(context)),
        ),
      ),
    );
  }

  Container _buildLogo() {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 50),
      child: ShowUpAnimation(
        animationDuration: const Duration(seconds: 1),
        direction: Direction.vertical,
        curve: Curves.linear,
        offset: 0.3,
        child: Image.asset(
          Resources.logo_altow_white,
          width: 150,
        ),
      ),
    );
  }

  void navigateTo(context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (route) => false);
  }
}
