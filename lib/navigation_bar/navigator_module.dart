import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/navigation_bar/navigator_routes.dart';
import 'package:brandsome/navigation_bar/ui/screens/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigatorModule extends RoutModule {
  final NavigationScreen _navigationScreen;
  NavigatorModule(this._navigationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      NavRoutes.nav_rout: (context) => _navigationScreen,
    };
  }
}
