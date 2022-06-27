import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../../../abstracts/states/state.dart';
import '../../../business_module/ui/screen/add_business.dart';
import '../../../follower_module/Follower_route.dart';
import '../../../follower_module/ui/screens/follower_list.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/service/theme_serrvice/theme_service.dart';
import '../../account_route.dart';
import '../../response/settings_response.dart';
import '../widget/account_info.dart';



class SettingSuccess extends States {
  final GetAccountSetting getaccsetting;
  SettingSuccess({required this.getaccsetting});

  @override
  Widget getUI(BuildContext context) {
    return

      SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding:  EdgeInsets.all(15.0),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.20,
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(
                           getaccsetting.imageUrl.toString(),
                          ),
                          radius: 60,
                          backgroundColor: Colors.transparent,
                        ),
                      )),
                  Column(
                    children: [
                      Text(getaccsetting.businessesCount.toString(),),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Business",
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(getaccsetting.reviewCount.toString(),),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
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
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ]),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22.0, top: 10),
              child: Text(
                "${getaccsetting.name} ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, AccountRoutes.AccountttScreen
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
                    Icon(
                      Icons.person,
                      size: 14,
                    ),
                    Text(
                      "Account info",
                    ),
                    SizedBox(
                      width: 145,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 65,

              child: ListView.builder(

                  // physics:const BouncingScrollPhysics(
                  //     parent: AlwaysScrollableScrollPhysics()),
                  itemCount: getaccsetting.businesses!.length,
    itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 30,

                  ),
                  child: Column(
                    children:[ Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.business,
                          size: 14,
                        ),
                        Text(
                          getaccsetting.businesses![index].name.toString(),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),

                      ],
                    ),
                      SizedBox(height: 20,)
                  ]),
                );
    }
              ),
            ),

            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context, FollowerRoutes.Followers

                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.add_business,
                      size: 14,
                    ),
                    Text(
                      "Businesses I follow",
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTileSwitch(
              value: Theme
                  .of(context)
                  .brightness == Brightness.dark,
              leading: Icon(
                Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Icons.nightlight_round_rounded
                    : Icons.wb_sunny,
              ),
              onChanged: (mode) {
//                      widget._themeDataService.switchDarkMode(mode);
                AppThemeDataService().switchDarkMode(mode);
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
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
                        color: Theme
                            .of(context)
                            .primaryColor, fontSize: 13),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBusiness(),
                      ),
                    );
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
                      builder: (context) =>
                          CustomDeleteDialog(
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
  }