import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/hadeth_dm.dart';

import '../../core/styles/text_styles.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethDetailsScreen";

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadethDm hadeth = ModalRoute.of(context)!.settings.arguments as HadethDm;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(hadeth.title, style: TextStyles.smallTitle()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/img_left_corner.png"),
                    Image.asset("assets/images/img_right_corner.png"),
                  ],
                ),
                Text(hadeth.title, style: TextStyles.mediumTitle()),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  child: Text(
                    hadeth.content,
                    style: TextStyles.largeBody().copyWith(height: 1.8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Image.asset("assets/images/img_bottom_decoration.png"),
        ],
      ),
    );
  }
}
