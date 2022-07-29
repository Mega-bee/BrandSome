import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/setting_module/response/settings_response.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'package:brandsome/utils/service/theme_serrvice/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../../../generated/l10n.dart';
import '../../../utils/images/images.dart';

class SettingNotLogged extends States {
  final SettingsScreenState _settingsScreenState ;
  SettingNotLogged(this._settingsScreenState) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children: [
          ListTileSwitch(
            value: Theme.of(context).brightness == Brightness.dark,
            leading: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.nightlight_round_rounded
                  : Icons.wb_sunny,
            ),
            onChanged: (mode) {
//                      widget._themeDataService.switchDarkMode(mode);
              AppThemeDataService().switchDarkMode(mode);
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.grey,
            title: Text(S.of(context).darkMode,),
          ),
          ListTile(title: Text('Add business'),
            leading: Icon(Icons.login),
            onTap: (){
              _settingsScreenState.goToLogin();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
          ),

          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.info_outlined,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${S.of(context).appVersion} 1.0.0",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(ImageAsset.MEGABEE,width: 15,height: 12,),

          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}