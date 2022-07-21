
import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/home_page/home_route.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../categories_module/ui/screen/categories_list_screen.dart';

@injectable
class HomeModule extends RoutModule {
  final HomePage _homePage;
  final CategoryListScreen _categoryListScreen;


  HomeModule(
    this._homePage,this._categoryListScreen,
  ) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_Screen: (context) => _homePage,
      HomeRoutes.CATEGORY_LIST_SCREEN:(context)=>_categoryListScreen
    };
  }
}
