import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../business_module/ui/screen/business_screen.dart';

import '../../../setting_module/ui/screen/setting_screen.dart';

@injectable
class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationScreen> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    getIt<BusinessScreen>(),
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
        color: Theme.of(context).bottomAppBarColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
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
          ),
          Icon(
            FontAwesomeIcons.briefcase,
            size: 20,
          ),
          Icon(
            Icons.settings,
          ),
        ],
      ),
    );
  }
}
