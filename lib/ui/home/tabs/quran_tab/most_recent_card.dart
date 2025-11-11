import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/sura_dm.dart';

import '../../../../core/styles/text_styles.dart';

class MostRecentCard extends StatelessWidget {
  final SuraDM sura;
  const MostRecentCard({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEng,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
                Text(
                  sura.nameAr,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
                Text(
                  "${sura.ayatNumber} Verses",
                  style: TextStyles.largeBody(textColor: AppColors.black),
                ),
              ],
            ),
            Expanded(child: Image.asset("assets/images/most_recent_img.png")),
          ],
        ),
      ),
    );
  }
}
