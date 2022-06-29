import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/setting_module/setting_route.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'ui/screen/account_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class   SettingModule extends RoutModule {
  final SettingsScreen _settingScreen;
  final AccountInfoScreen _accountInfoScreen;
  SettingModule(this._settingScreen, this._accountInfoScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SettingRoutes.Settings_Screen: (context) => _settingScreen,
      SettingRoutes.Account_Screen: (context) => _accountInfoScreen,



    };
  }
}
