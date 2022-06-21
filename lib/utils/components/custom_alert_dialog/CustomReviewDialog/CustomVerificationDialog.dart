import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomReviewDialog extends StatefulWidget {
  final String content;
  final Function continueBtn;

  CustomReviewDialog({
    required this.content,
    required this.continueBtn,
  });

  @override
  State<CustomReviewDialog> createState() => _CustomReviewDialog();
}

class _CustomReviewDialog extends State<CustomReviewDialog> {
  final review = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add review",
                  style: TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 6,
                  maxLines: 12,
                  style: TextStyle(color: hintText, fontSize: 15),
                  controller: review,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 5,
                        ),
                      ),
                      // hintText: 'Enter your username',
                      // hintStyle:
                      //     TextStyle(fontSize: 12, color: darkWhiteColor),
                      contentPadding: EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.continueBtn();
            },
            child: Text("Save review"),
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
