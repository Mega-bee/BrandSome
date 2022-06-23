import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../follower_module/ui/screens/follower_list.dart';
import '../../../hive/hive.dart';
import '../../../utils/components/Seperator/seperator_doted.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/components/custom_alert_dialog/theme_dialog/customThemeDialog.dart';
import '../../../utils/service/theme_serrvice/theme_service.dart';
import '../../../utils/style/colors.dart';
import '../widget/account_info.dart';
import '../widget/add_business.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.08,
                            width:MediaQuery.of(context).size.width*0.17,

                            child: CircleAvatar(
                              foregroundImage: AssetImage("assets/images/IMG_0095.JPG",),
                              radius:120,

                              backgroundColor: Colors.transparent,
                            ),
                            // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                          )),
                        SizedBox(width: 50,),
                        Column(children: [
                          Text("20",style: TextStyle(color: Colors.white,)),
                          SizedBox(height: 3,
                          ),
                          Text("Business",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                        ],),
                        SizedBox(width: 50,),
                        Column(children: [
                          Text("2000",style: TextStyle(color: Colors.white,)),
                          SizedBox(height: 3,
                          ),
                          Text("Reviews",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                        ],),
                        SizedBox(width: 50,),
                        Column(children: [
                          Text("200",style: TextStyle(color: Colors.white,)),
                          SizedBox(height: 3,
                          ),
                          Text("Followers",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                        ],),

                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Christian Zakhour ",style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
                    ),

                    SizedBox(
                      height: 10,
                    ),
            Container(color:Colors.white,height: 0.1,),

            SizedBox(
              height: 30,
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountInfoScreen()),
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
                      Icons.person,
                      size: 14,
                    ),
                    Text(
                      "Account info",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.business,
                    size: 14,
                  ),
                  Text("Business 1",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    width: 160,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.business,
                    size: 14,
                  ),
                  Text("Business 2",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    width: 160,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.business,
                    size: 14,
                  ),
                  Text("Business 3",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    width: 160,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Followers()),
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
                    Text("Businesses I follow",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.mode_edit,
                    size: 14,
                  ),
                  Text("Dark Mode",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    width: 160,
                  ),
                  Transform.scale(
                    scale: 1,
                    child: Switch.adaptive(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveTrackColor: Colors.grey,
                        value: value,
                        onChanged: (value) {
                          this.value = value;
                          AppThemeDataService().switchDarkMode(value);
                          setState(
                            () {},
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              color: Theme.of(context).scaffoldBackgroundColor,

//              color:  ThemeHelper().getisDark() ? whiteColor : blackColor,
              height: 0.1,
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  child: Text(
                    "Add business",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 12),
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
              padding: const EdgeInsets.all(8.0),
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
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
//              color:  ThemeHelper().getisDark() ? whiteColor : blackColor,
              height: 0.1,
            ),
            SizedBox(
              height: 5,
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
      ),
    );
  }
}
