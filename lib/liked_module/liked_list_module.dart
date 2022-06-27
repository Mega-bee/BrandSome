import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_details_module/ui/screen/business_details.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/business_module/ui/screen/searbarfilter_business_screen.dart';
import 'package:brandsome/liked_module/liked_list_route.dart';
import 'package:brandsome/liked_module/ui/screen/liked_by_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@injectable
class  LikedListModule extends RoutModule {
  final LikeByScreen _likeByScreen;

  LikedListModule(this._likeByScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      LikedListRoute.LIKED_LIST: (context) => _likeByScreen,

    };
  }
}
