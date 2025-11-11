import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/sura_dm.dart';

import '../../core/styles/text_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String? content;

  @override
  Widget build(BuildContext context) {
    final SuraDM sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (content == null) {
      readSuraDetails(sura.suraNumber);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(sura.nameEng, style: TextStyles.smallTitle()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/img_left_corner.png"),
                Text(sura.nameAr, style: TextStyles.mediumTitle()),
                Image.asset("assets/images/img_right_corner.png"),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Text(
                    (content == null) ? "" : content!,
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

  Future<void> readSuraDetails(int suraNumber) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/Suras/$suraNumber.txt",
    );
    List<String> suraAyas = suraContent.trim().split("\n");
    suraContent = "";
    for (int i = 0; i < suraAyas.length; i++) {
      suraContent = "$suraContent${suraAyas[i].trim()} [${i + 1}] ";
    }
    content = suraContent;
    setState(() {});
  }
}
