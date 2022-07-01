import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../setting_module/ui/screen/add_location.dart';

@injectable
class   BusinessModule extends RoutModule {
  final BusinessScreen _businessScreen;
  final AddBusiness _addBusiness;
  final AddLocationScreen _addLocationScreen;
  BusinessModule(this._businessScreen, this._addBusiness,this._addLocationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BusinessRoutes.BUSINESS_LIST_SCREEN: (context) => _businessScreen,
      BusinessRoutes.ADD_BUSINESS: (context) => _addBusiness,
      BusinessRoutes.ADD_LOCATION:(context)=>_addLocationScreen,
    };
  }
}
