import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر"
  ];
  int currentZekr = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Expanded(
              child: Image.asset(
                "assets/images/sebha_bg.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  AppColors.black.withValues(alpha: 0.7),
                  AppColors.black,
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: size.height * 0.04,
                  children: [
                    Image.asset(
                      "assets/images/img_header.png",
                      width: size.width * 0.7,
                    ),
                    Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: "janna",
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.5,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: size.width * 0.9,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/headOfSebha.png",
                                    width: size.width * 0.17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: size.height * 0.075),
                              GestureDetector(
                                onTap: (){
                                  angle += pi * 0.07;
                                  counting();
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedRotation(
                                      duration: Duration(milliseconds: 300),
                                      turns: angle / (2 * pi),
                                      child: Image.asset(
                                        "assets/images/SebhaBody 1.png",
                                        width: size.width * 0.9,
                                      ),
                                    ),
                                    Column(
                                      spacing: 16,
                                      children: [
                                        Text(
                                          azkar[currentZekr].toString(),
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35,
                                            fontFamily: "janna",
                                          ),
                                        ),
                                        Text(
                                          counter.toString(),
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35,
                                            fontFamily: "janna",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void counting() {
    counter++;
    currentZekr = (counter ~/ 33) % azkar.length;
    setState(() {});
  }
}
