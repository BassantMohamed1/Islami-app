import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islami/core/styles/app_colors.dart';
import 'package:islami/core/styles/text_styles.dart';
import 'package:islami/models/sura_dm.dart';
import 'package:islami/ui/home/tabs/quran_tab/most_recent_card.dart';
import 'package:islami/ui/home/tabs/quran_tab/sura_card.dart';
import 'package:islami/ui/sura_details/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> searchList = [];
  List<SuraDM> mostRecent = [];

  @override
  void initState() {
    super.initState();
    _loadMostRecent();
  }

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
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Image.asset(
                  "assets/images/img_header.png",
                  width: size.width * 0.7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    onChanged: (input) {
                      _searchInSuraList(input);
                    },
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
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (searchList.isEmpty) {
                        return CustomScrollView(
                          slivers: [
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Most Recent",
                                      style: TextStyles.smallLabel(
                                        textColor: AppColors.offWhite,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(child: SizedBox(height: 16)),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: size.height * 0.18,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        InkWell(
                                          onTap: (){
                                            onClickSura(mostRecent[index]);
                                          },
                                          child: MostRecentCard(
                                            sura: mostRecent[index],
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 8,),
                                    itemCount: mostRecent.length,
                                  ),
                                ),
                              ),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(child: SizedBox(height: 16)),
                            //SliverList.builder(itemBuilder: itemBuilder),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Suras List",
                                    style: TextStyles.smallLabel(
                                      textColor: AppColors.offWhite,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(child: SizedBox(height: 16)),
                            SliverList.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  onClickSura(SuraDM.surasList[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: SuraCard(
                                    sura: SuraDM.surasList[index],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) => Divider(
                                indent: 36,
                                endIndent: 36,
                                color: AppColors.white,
                              ),
                              itemCount: SuraDM.surasList.length,
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                onClickSura(searchList[index]);
                              },
                              child: SuraCard(sura: searchList[index]),
                            ),
                            separatorBuilder: (context, index) => Divider(
                              indent: 36,
                              endIndent: 36,
                              color: AppColors.white,
                            ),
                            itemCount: searchList.length,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _searchInSuraList(String input) {
    if (input.isEmpty) {
      searchList = [];
    } else {
      searchList = SuraDM.surasList
          .where((e) => e.nameAr.contains(input))
          .toList();
      if (searchList.isEmpty) {
        searchList = SuraDM.surasList
            .where((e) => e.nameEng.toLowerCase().contains(input.toLowerCase()))
            .toList();
      }
    }
    setState(() {});
  }

  void onClickSura(SuraDM sura){
    storeSuraID(sura.suraNumber);
    Navigator.pushNamed(
      context,
      SuraDetailsScreen.routeName,
      arguments: sura,
    );
  }

  Future<void> storeSuraID(int suraNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? mostRecent =
        sharedPreferences.getStringList("mostRecent") ?? [];
    if (mostRecent.contains(suraNumber.toString())) {
      mostRecent.removeWhere((e) => e == suraNumber.toString());
    }
    mostRecent = [suraNumber.toString(), ...mostRecent];
    await sharedPreferences.setStringList("mostRecent", mostRecent);
    _loadMostRecent();
  }

  Future<void> _loadMostRecent() async {
    mostRecent = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> mostRecentList =
        sharedPreferences.getStringList("mostRecent") ?? [];
    for (String suraNumber in mostRecentList) {
      mostRecent.add(SuraDM.surasList[int.parse(suraNumber) - 1]);
    }
    setState(() {});
  }
}
