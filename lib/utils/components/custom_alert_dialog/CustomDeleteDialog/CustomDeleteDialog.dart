import 'package:flutter/material.dart';

class CustomDeleteDialog extends StatelessWidget {
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
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      yesBtn();
                    },
                    child: Text("  Yes  ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      noBtn();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
//                        primary: primaryColor,
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
