import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_details_module/ui/screen/business_details.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/business_module/ui/screen/searbarfilter_business_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'business_details_route.dart';

@injectable
class  BusinessDetailsModule extends RoutModule {
  final BusnessDetailsScreen _businessDetailsScreen;

  BusinessDetailsModule(this._businessDetailsScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN: (context) => _businessDetailsScreen,

    };
  }
}
