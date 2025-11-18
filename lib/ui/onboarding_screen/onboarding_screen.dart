import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/onboarding_dm.dart';
import 'package:islami/core/styles/text_styles.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboardingScreen";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int i = 0;

  @override
  void initState() {
    super.initState();
    OnboardingDM.generateOnboardingDMs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: OnboardingDM.onboardingList.length,
                onPageChanged: (index) {
                  setState(() => i = index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/img_header.png",
                          width: MediaQuery.sizeOf(context).width * 0.7,
                        ),
                        OnboardingDM.onboardingList[index].image,
                        Text(
                          OnboardingDM.onboardingList[index].label,
                          style: TextStyles.mediumTitle(),
                          textAlign: TextAlign.center,
                        ),
                        OnboardingDM.onboardingList[index].phrase.isNotEmpty
                            ? Text(
                                OnboardingDM.onboardingList[index].phrase,
                                style: TextStyles.smallTitle(),
                                textAlign: TextAlign.center,
                              )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (i != 0) {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    i != 0 ? "Back" : "",
                    style: TextStyles.largeBody(),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: OnboardingDM.onboardingList.length,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.gold,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (i != OnboardingDM.onboardingList.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      markNotFirstTime();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  },
                  child: Text(
                    i != OnboardingDM.onboardingList.length - 1
                        ? "Next"
                        : "Finish",
                    style: TextStyles.largeBody(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> markNotFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("firstTime", false);
  }
}
