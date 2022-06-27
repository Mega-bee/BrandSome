import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/setting_module/ui/widget/account_info.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'account_route.dart';



@injectable
class   AccountModule extends RoutModule {
  final AccountInfoScreen _accountInfoScreen;

  AccountModule(this._accountInfoScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      AccountRoutes.AccountttScreen: (context) => _accountInfoScreen,



    };
  }
}
