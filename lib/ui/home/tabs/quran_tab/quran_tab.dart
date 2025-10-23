import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/core/styles/text_styles.dart';
import 'package:islami/models/sura_dm.dart';
import 'package:islami/ui/home/tabs/quran_tab/sura_card.dart';
import 'package:islami/ui/sura_details/sura_details_screen.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/quran_bg.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withValues(alpha: 0.7),
                  AppColors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                spacing: 16,
                children: [
                  Image.asset(
                    "assets/images/img_header.png",
                    width: size.width * 0.7,
                  ),
                  TextField(
                    style: TextStyles.largeBody(textColor: AppColors.white),
                    cursorColor: AppColors.gold,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.black.withValues(alpha: 0.7),
                      prefixIcon: ImageIcon(
                        AssetImage("assets/icons/ic_quran.png"),
                        color: AppColors.gold,
                      ),
                      hintText: "Sura Name",
                      hintStyle: TextStyles.largeBody(
                        textColor: AppColors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gold, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gold, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Most Recent",
                      style: TextStyles.smallLabel(
                        textColor: AppColors.offWhite,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Suras List",
                      style: TextStyles.smallLabel(
                        textColor: AppColors.offWhite,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SuraDetailsScreen.routeName,
                            arguments: SuraDM.surasList[index],
                          );
                        },
                        child: SuraCard(sura: SuraDM.surasList[index]),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        indent: 36,
                        endIndent: 36,
                        color: AppColors.white,
                      ),
                      itemCount: SuraDM.surasList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
