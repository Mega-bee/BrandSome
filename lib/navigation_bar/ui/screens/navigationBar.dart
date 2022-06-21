import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../business_module/ui/screen/business.dart';
import '../../../hive/hive.dart';
import '../../../home_page/ui/screen/homePage.dart';
import '../../../setting_module/ui/screen/setting_screen.dart';


class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    BusinessScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(

        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(

        animationDuration: Duration(milliseconds: 400),
        color:ThemeHelper().getisDark() ? blackColor : whiteColor,
        buttonBackgroundColor: ThemeHelper().getisDark() ? blackColor : blackColor,

        backgroundColor: Colors.transparent,

        height: 60,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: currentIndex == 0?ThemeHelper().getisDark() ? primaryColor : primaryColor:ThemeHelper().getisDark() ? whiteColor : blackColor,
            // color: ThemeHelper().getisDark() ? textColor : blackColor ,
          ),
          Icon(
            FontAwesomeIcons.briefcase,size: 20,
            color: currentIndex == 1?ThemeHelper().getisDark() ? primaryColor : primaryColor:ThemeHelper().getisDark() ? whiteColor : blackColor,

            // color: ThemeHelper().getisDark() ? textColor : blackColor,
          ),
          Icon(
            Icons.settings,
            color: currentIndex == 2?ThemeHelper().getisDark() ? primaryColor : primaryColor:ThemeHelper().getisDark() ? whiteColor : blackColor,

            // color: ThemeHelper().getisDark() ? textColor : blackColor,
          ),

        ],
      ),
    );
  }
}


