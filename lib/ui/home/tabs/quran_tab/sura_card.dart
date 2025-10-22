import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../models/sura_dm.dart';

class SuraCard extends StatelessWidget {
  final SuraDM sura;

  const SuraCard({required this.sura, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/img_sur_number_frame.png", width: 56),
              Text(
                sura.suraNumber.toString(),
                style: TextStyles.largeBody(textColor: AppColors.white),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sura.nameEng,
                style: TextStyles.smallLabel(textColor: AppColors.white),
              ),
              SizedBox(height: 8),
              Text(
                "${sura.ayatNumber} Verses",
                style: TextStyles.mediumBody(textColor: AppColors.white),
              ),
            ],
          ),
        ),
        Text(
          sura.nameAr,
          style: TextStyles.smallLabel(textColor: AppColors.white),
        ),
      ],
    );
  }
}
