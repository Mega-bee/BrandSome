import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class   BusinessModule extends RoutModule {
  final BusinessScreen _businessScreen;
  BusinessModule(this._businessScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BusinessRoutes.BUSINESS_LIST_SCREEN: (context) => _businessScreen,
    };
  }
}
