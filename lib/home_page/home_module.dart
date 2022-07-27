import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/home_page/home_route.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModule extends RoutModule {
  final HomePage _homePage;

  HomeModule(
    this._homePage,
  ) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_Screen: (context) => _homePage,
    };
  }
}
