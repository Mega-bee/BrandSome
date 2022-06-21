import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDeleteDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function yesBtn;
  final Function noBtn;

  CustomDeleteDialog({
    required this.title,
    required this.content,
    required this.yesBtn,
    required this.noBtn,
  });

  @override
  State<CustomDeleteDialog> createState() => _CustomDeleteDialog();
}

class _CustomDeleteDialog extends State<CustomDeleteDialog> {
  final username = TextEditingController();
  final phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BerlinSansFB"),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Are you sure you want\n "
                "to delete your account? ",style: TextStyle(fontSize: 13),),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.yesBtn();
                    },
                    child: Text("  Yes  ",style: TextStyle(color: primaryColor,fontWeight: FontWeight.w400,fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        elevation: 0,
                        side: BorderSide(color:primaryColor ),
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.noBtn();
                    },
                    child: Text("Cancel",style: TextStyle(fontSize: 12),),
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        elevation: 0,
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
