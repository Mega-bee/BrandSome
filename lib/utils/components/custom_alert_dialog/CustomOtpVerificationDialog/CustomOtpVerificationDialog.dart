import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../style/text_style.dart';

class CustomOtpVerificationDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function continueBtn;

  CustomOtpVerificationDialog({
    required this.title,
    required this.content,
    required this.continueBtn,
  });

  @override
  State<CustomOtpVerificationDialog> createState() =>
      _CustomOtpVerificationDialog();
}

class _CustomOtpVerificationDialog extends State<CustomOtpVerificationDialog> {
  final username = TextEditingController();
  final phonenumber = TextEditingController();

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
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.title,
              style: TextStyle(
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
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Enter the OTP you received to\n',
//                    style: TextStyle(color: darkWhiteColor, fontSize: 17),
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          height: 30,
                        ),
                      ),
                    ]),
                TextSpan(
                  text: '+961 0000000',
//                  style: TextStyle(color: blackColor, fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.height / 3,
            child: TextField(
              maxLength: 4,
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                contentPadding:
                    EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 10),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.continueBtn();
            },
            child: Text("Resend OTP"),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
