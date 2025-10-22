import 'package:flutter/material.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/models/sura_dm.dart';
import 'package:islami/ui/home/tabs/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SuraDM.generateSuraList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Expanded(child: tabs[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
            icon: buildBottomNavigationBarIcon(index: 0, iconPath: "assets/icons/ic_quran.png"),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: buildBottomNavigationBarIcon(index: 1, iconPath: "assets/icons/ic_hadeth.png"),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: buildBottomNavigationBarIcon(index: 2, iconPath: "assets/icons/ic_sebha.png"),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: buildBottomNavigationBarIcon(index: 3, iconPath: "assets/icons/ic_radio.png"),
            label: "Time",
          ),
          BottomNavigationBarItem(
            icon: buildBottomNavigationBarIcon(index: 4, iconPath: "assets/icons/ic_time.png"),
            label: "Radio",
          ),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Container buildBottomNavigationBarIcon({required int index, required String iconPath}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: (index == selectedIndex)? 0.6 : 0,),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: ImageIcon(AssetImage(iconPath)),
      ),
    );
  }
}
