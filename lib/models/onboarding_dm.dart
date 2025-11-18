import 'package:flutter/material.dart';

class OnboardingDM {
  final Image image;
  final String label;
  final String phrase;

  const OnboardingDM({
    required this.image,
    required this.label,
    required this.phrase,
  });

  static List<OnboardingDM> onboardingList = [];
  static void generateOnboardingDMs() {
    onboardingList = [];
    for (int i = 0; i < imagesList.length; i++) {
      onboardingList.add(
        OnboardingDM(
          image: imagesList[i],
          label: labels[i],
          phrase: phrases[i],
        ),
      );
    }
  }
}

List<Image> imagesList = [
  Image.asset("assets/images/Group.png"),
  Image.asset("assets/images/kabba.png"),
  Image.asset("assets/images/welcome.png"),
  Image.asset("assets/images/bearish.png"),
  Image.asset("assets/images/radio.png"),
];

List<String> labels = [
  "Welcome To Islami App",
  "Welcome To Islami",
  "Reading The Quran",
  "Bearish",
  "Holy Quran Radio",
];

List<String> phrases = [
  "",
  "We Are Very Excited To Have You In Our Community",
  "Read, and your Lord is the Most Generous",
  "Praise the name of your Lord, the Most High",
  "You can listen to the Holy Quran Radio through the application for free and easily",
];
