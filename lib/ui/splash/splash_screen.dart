import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? firstTime;

  @override
  void initState() {
    super.initState();
    checkFirstTime();
    Timer(Duration(seconds: 3), () {
      if (firstTime == null) {
        Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
      } else if (firstTime == false) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/islami_logo.png",
                  width: size.width * 0.4,
                ).zoomIn(duration: Duration(seconds: 3)),
                Image.asset(
                  "assets/images/splash_screen_pic.png",
                  width: size.width * 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    firstTime = sharedPreferences.getBool("firstTime");
  }
}
