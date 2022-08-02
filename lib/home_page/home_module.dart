import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/home_page/home_route.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../notification_module/ui/screens/notification_screen.dart';

@injectable
class HomeModule extends RoutModule {
  final HomePage _homePage;
  final NotificationScreen _notificationScreen;

  HomeModule(
    this._homePage,
      this._notificationScreen
  ) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_Screen: (context) => _homePage,
      HomeRoutes.NOTIFICATION_Screen: (context) => _notificationScreen,
    };
  }
}
