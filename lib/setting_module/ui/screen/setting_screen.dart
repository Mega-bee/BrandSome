import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';
import '../widget/account_info.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120,),

            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountInfoScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Account info",style: StyleText.SettingsStyle,),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business 1",style: StyleText.SettingsStyle,),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                ],
              ),
            ),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business 2",style: StyleText.SettingsStyle,),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                ],
              ),
            ),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business 3",style: StyleText.SettingsStyle,),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                ],
              ),
            ),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Businesses I follow",style: StyleText.SettingsStyle,),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                ],
              ),
            ),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme",style: StyleText.SettingsStyle,),
                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,),

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.130,),

            ElevatedButton(onPressed: (){}, child: Text("Add business"),style: ElevatedButton.styleFrom(
        primary: primaryColor,
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
    ),)
          ],
        ),
      ),
    );
  }
}
