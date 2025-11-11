import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_card.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../models/hadeth_dm.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethDm> ahadeth = [];

  @override
  void initState() {
    super.initState();
    _loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/hadith_bg.png",
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
            child: Column(
              children: [
                Image.asset(
                  "assets/images/img_header.png",
                  width: size.width * 0.7,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: CarouselSlider(
                      items: ahadeth.map((e) => HadethCard(hadeth: e)).toList(),
                      options: CarouselOptions(
                        height: double.infinity,
                        viewportFraction: 0.75,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadAhadeth() async {
    String hadethText = "";
    List<String> hadethVerses = [];
    String title = "";
    String content = "";
    for (int i = 1; i < 51; i++) {
      hadethText = await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      hadethVerses = hadethText.trim().split("\n");
      title = hadethVerses[0];
      content = "";
      hadethVerses = hadethVerses.sublist(1);
      for (String verse in hadethVerses) {
        content += "$verse ";
      }
      HadethDm hadeth = HadethDm(title: title, content: content);
      ahadeth.add(hadeth);
    }
    setState(() {});
  }
}
