import 'package:brandsome/business_card_details_module/model/business_card_model.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../follower_module/ui/screens/follower_list.dart';
import '../../../utils/components/Seperator/seperator_doted.dart';
import '../../../utils/style/colors.dart';
import '../widget/account_info.dart';
import '../widget/add_business.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: blackColor,
        title: Text("Settings"),
        centerTitle: true,
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
                  Text("Post",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                ],),
                SizedBox(width: 50,),
                Column(children: [
                  Text("2000",style: TextStyle(color: Colors.white,)),
                  SizedBox(height: 3,
                  ),
                  Text("Followers",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                ],),
                SizedBox(width: 50,),
                Column(children: [
                  Text("200",style: TextStyle(color: Colors.white,)),
                  SizedBox(height: 3,
                  ),
                  Text("Following",style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic),),
                ],),

            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Christian Zakhour ",style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("- Flutter Mobile Developer",style: TextStyle(color:Colors.grey,fontSize: 10,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("- Usek-Zahle",style: TextStyle(color:Colors.grey,fontSize: 10,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
            ),
            SizedBox(
              height: 10,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
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
                  left: 30.0,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account info",
                      style: StyleText.SettingsStyle,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xffCCCCCC),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business 1",
                      style: GoogleFonts.poppins(
                          textStyle: StyleText.SettingsStyle)),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xffCCCCCC),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business 2",
                    style: StyleText.SettingsStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xffCCCCCC),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business 3",
                    style: StyleText.SettingsStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xffCCCCCC),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(color:primaryColor,height: 0.2,

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
                  left: 30.0,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Businesses I follow",
                      style: StyleText.SettingsStyle,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xffCCCCCC),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: StyleText.SettingsStyle,
                  ),
                  Transform.scale(
                    scale: 1,
                    child: Switch.adaptive(
                      activeColor: primaryColor,
                        inactiveTrackColor: whiteColor,
                        value: value,
                        onChanged: (value) => setState(() {
                              this.value = value;
                            })),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MySeparator(color:primaryColor,height: 0.2,

            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBusiness()),
                );
              },
              child: Text("Add business"),
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20)),
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
