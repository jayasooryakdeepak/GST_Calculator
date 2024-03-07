import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gst_calculator/main.dart';
import 'package:page_transition/page_transition.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override

  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/icon/icon.png',
            height: 100,
          ),
          const Text(
            'GST Calculator',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 8, 107, 189),
      nextScreen: const gstCalculator(),
      splashIconSize: 150,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
    
  }
}
