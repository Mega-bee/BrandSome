import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/setting_module/setting_route.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../follower_module/ui/screens/follower_list.dart';

@injectable
class   SettingModule extends RoutModule {
  final SettingsScreen _settingScreen;

  SettingModule(this._settingScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SettingRoutes.Settings_Screen: (context) => _settingScreen,



    };
  }
}
