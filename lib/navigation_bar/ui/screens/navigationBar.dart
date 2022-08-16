import 'dart:async';

import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';


@injectable
class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() =>  NavigationState();
}

class  NavigationState extends State<NavigationScreen> {
  int currentIndex = 0;
  StreamSubscription? _globalPositionManager;
  StreamSubscription? _globalFilterManager;

  final screens = [
    getIt<HomePage>(),
    getIt<BusinessScreen>(),
    getIt<SettingsScreen>(),

  ];


  @override
  void initState() {
    super.initState();
    _globalPositionManager =
        getIt<GlobalStateManager>().currentIndexRefresh.listen((event) {
//          currentIndex = event;
          setState(() {
            currentIndex = event;
          });
        });
    _globalFilterManager =
        getIt<GlobalStateManager>().filterRefresh.listen((event) {
//          currentIndex = event;
          setState(() {
            currentIndex = 1;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        color: Theme.of(context).brightness==Brightness.light?Colors.white70:Colors.black54,
        // color: Colors.black87,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        height: 65,
        onTap: (index) {
          setState(() {
          currentIndex = index;
          });
        },
        items: const [
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
