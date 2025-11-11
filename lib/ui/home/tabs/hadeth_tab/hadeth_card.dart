import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/hadeth_dm.dart';
import 'package:islami/ui/hadeth_details_screen/hadeth_details_screen.dart';

import '../../../../core/styles/text_styles.dart';

class HadethCard extends StatelessWidget {
  final HadethDm hadeth;
  const HadethCard({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/left_corner.png"),
                      Image.asset("assets/images/right_corner.png"),
                    ],
                  ),
                  Text(
                    hadeth.title,
                    style: TextStyles.mediumLabel(textColor: AppColors.black),
                  ),
                ],
              ),
              Text(
                hadeth.content,
                style: TextStyles.largeBody(textColor: AppColors.black),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
