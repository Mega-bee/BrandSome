import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../follower_module/ui/screens/follower_list.dart';
import 'Follower_route.dart';

@injectable
class  FollowerModule extends RoutModule {

  final Followers _followers;
  FollowerModule(this._followers) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      FollowerRoutes.Followers: (context) => _followers,


    };
  }
}
