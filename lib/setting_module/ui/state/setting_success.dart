import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/setting_module/setting_route.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../../../abstracts/states/state.dart';
import '../../../follower_module/Follower_route.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/service/theme_serrvice/theme_service.dart';
import '../../response/settings_response.dart';

class SettingSuccess extends States {
  final GetAccountSetting getaccsetting;
  final SettingsScreenState _settingsScreenState ;
  SettingSuccess(this._settingsScreenState, {required this.getaccsetting}) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                width: 80,
                height: 80,
                child: CachedNetworkImage(
                  imageUrl: getaccsetting.imageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  getaccsetting.businessesCount.toString(),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Business",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  getaccsetting.reviewCount.toString(),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Reviews",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Column(
              children: [
                Text("${getaccsetting.followingCount}", style: TextStyle()),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Following",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ]),
          Center(
            child: Text(
              "${getaccsetting.name} ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SettingRoutes.Account_Screen,
              );
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
                end: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Account info",
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: getaccsetting.businesses!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 20.0, end: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.business,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            getaccsetting.businesses![index].name.toString(),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                );
              }),
          Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, FollowerRoutes.Followers);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_business,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Businesses I follow",
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
          ),
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
            switchActiveColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text('Dark mode'),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 30,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                child: Text(
                  "Add business",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 13),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, BusinessRoutes.ADD_BUSINESS);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 30,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomDeleteDialog(
                      title: "Delete account",
                      content: "",
                      yesBtn: () {
                        Navigator.pop(context);
                      },
                      noBtn: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
                child: Text(
                  "Delete account",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10,
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
                "App Version 1.0.0",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ]),
          ),
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
