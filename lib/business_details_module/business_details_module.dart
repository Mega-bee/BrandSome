import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_details_module/ui/screen/business_details.dart';
import 'package:brandsome/business_details_module/ui/screen/update_business.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'business_details_route.dart';

@injectable
class  BusinessDetailsModule extends RoutModule {
  final BusnessDetailsScreen _businessDetailsScreen;
  final UpdateBusiness _updateBusiness;

  BusinessDetailsModule(this._businessDetailsScreen,this._updateBusiness) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN: (context) => _businessDetailsScreen,
      BusinessDetailsRoutes.BUSINESS_UPDATE_SCREEN: (context) => _updateBusiness,

    };
  }
}
