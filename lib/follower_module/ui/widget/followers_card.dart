import 'package:brandsome/liked_by_module/model/liked_by_model.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowCard extends StatefulWidget {

  @override
  State<FollowCard> createState() => _FollowCardState();
}

class _FollowCardState extends State<FollowCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20,top: 20),
      child: ListTile(
        // leading: Image.asset(ImageAsset.TEST_IMAGE),
        leading:  CircleAvatar(
          backgroundImage: AssetImage(ImageAsset.TEST_IMAGE,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Walid Taktak",
                  style: TextStyle(color: darkWhiteColor, fontSize: 16),
                ),
                Text(
                  "Healthcare/Sports",
                  style: TextStyle(color: hintText, fontSize: 10),
                ),
              ],
            ),
            isSelected
                ? ElevatedButton(
                    onPressed: () {
                      isSelected = !isSelected;
                      setState(() {

                      });
                    },
                    child: Text("Follow",style: TextStyle(fontSize: 13),),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      isSelected = !isSelected;
                      setState(() {

                      });
                    },
                    child: Text("Unfollow",style: TextStyle(fontSize: 13),),
                    style: TextButton.styleFrom(
                        // shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                        side: BorderSide(color: primaryColor)),
                  )
          ],
        ),
      ),
    );
  }
}
