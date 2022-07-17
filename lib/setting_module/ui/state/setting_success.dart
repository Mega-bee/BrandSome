import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/setting_module/setting_route.dart';
import 'package:brandsome/setting_module/ui/screen/setting_screen.dart';
import 'package:brandsome/utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../../../abstracts/states/state.dart';
import '../../../business_details_module/business_details_route.dart';
import '../../../follower_module/Follower_route.dart';
import '../../../generated/l10n.dart';
import '../../../hive/hive.dart';
import '../../../localization_service/localizationSservice.dart';
import '../../../utils/images/images.dart';
import '../../../utils/service/theme_serrvice/theme_service.dart';
import '../../response/settings_response.dart';

class SettingSuccess extends States {
  final GetAccountSetting getaccsetting;
  final SettingsScreenState _settingsScreenState ;

  SettingSuccess(this._settingsScreenState, {required this.getaccsetting}) : super(false);
  bool isArabic=false;
  @override


  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(

        physics:const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
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
                  S.of(context).Business,
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
                  S.of(context).Review,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              "${getaccsetting.name} ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],),

          SizedBox(
            height: 3,
          ),

          Divider(
            thickness: 2,
          ),

          SizedBox(height: 20,),

          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: getaccsetting.businesses!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(
                        context, BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
                        arguments: {
                          "id": getaccsetting.businesses?[index].id.toString(),
                          "name": getaccsetting.businesses?[index].name.toString()
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 18.0, end: 30, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: CachedNetworkImage(
                                imageUrl:  getaccsetting.businesses![index].image.toString(),
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

                            SizedBox(
                              width: 27,
                            ),
                            Text(
                              getaccsetting.businesses![index].name.toString(),style: TextStyle(fontSize: 16)
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  ),
                );
              }),

          SizedBox(height: 20,),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 18.0,
                end: 30,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/bees-removebg-preview.png",


                        height: 30,width: 30,
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                          S.of(context).yourBees,style: TextStyle(fontSize: 16),
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
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SettingRoutes.Account_Screen,
              );
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 18.0,
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
                        width: 27,
                      ),
                      Text(
                        S.of(context).accountInfo,style: TextStyle(fontSize: 16),
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
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, FollowerRoutes.Followers);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
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
                        width: 27,
                      ),
                      Text(
                        S.of(context).businessesIFollow,style: TextStyle(fontSize: 16),
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
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 5,
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
            switchActiveColor: Colors.grey,

            title: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text(S.of(context).darkMode,style: TextStyle(fontSize: 16)),
            ),
          ),

          ListTileSwitch(
            value: LanguageHelper().getLanguage()=="ar"?true:false,

            leading: Text(
              " EN",

              style: TextStyle(fontSize: 10),
            ),
            onChanged: (mode) {
              print('fffffffffffffffffffff');
              LocalizationService().setLanguage(mode?"ar":"en");
            },

            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.grey,

            title: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text(S.of(context).languages,style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDeleteDialog(
                  title:S.of(context).logOut,
                  content: S.of(context).doYouReallyWantToLogOut,
                  yesBtn: () {
                    Navigator.pop(context);
                    _settingsScreenState.logOut();
                  },
                  noBtn: () {
                    Navigator.pop(context);
                  },
                ),
              );

            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.powerOff,size: 20,
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        S.of(context).logOut,style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          )  ,
          SizedBox(
            height: 5,
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
                  S.of(context).addBussines,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 13),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, BusinessRoutes.ADD_BUSINESS);
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsetsDirectional.only(
          //     start: 20.0,
          //     end: 30,
          //   ),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: TextButton(
          //       onPressed: () {
          //         showDialog(
          //           context: context,
          //           builder: (context) => CustomDeleteDialog(
          //             title: "Delete account",
          //             content: "",
          //             yesBtn: () {
          //               Navigator.pop(context);
          //             },
          //             noBtn: () {
          //               Navigator.pop(context);
          //             },
          //           ),
          //         );
          //       },
          //       child: Text(
          //         "Delete account",
          //         style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 13,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
          ),
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
