import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/categories_module/ui/screen/categories_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class   CategoryModule extends RoutModule {
  final CategoryListScreen _categoryListScreen;

  CategoryModule(this._categoryListScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CategoriesRoutes.CATEGORY_LIST_SCREEN: (context) => _categoryListScreen,

    };
  }
}
