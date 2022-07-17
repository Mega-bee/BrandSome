import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';

import '../../../request/Phone_change.dart';
import '../../screen/account_info_screen.dart';

class NumberOtpState extends States {
  AccountInfoScreenState screenState;
  NumberOtpState(this.screenState, {String? phonenumber}) : super(true);

  final phonenumber = TextEditingController();
  @override
  Widget getUI(BuildContext context) {
    return Center(child: Container(child: const Text("Super is false"),));
  }

  @override
  Widget getAlert(BuildContext context) {
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
            child: const Text(
              'Register account',
              style: TextStyle(
//                    color: blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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



                const Text(
                  "Phone Number",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
                  keyboardType: TextInputType.phone,
                  controller: phonenumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                      ),
                      hintText: 'Enter your phone number',
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                      contentPadding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              screenState.changeMobilenum(ChangenumberRequest(PhoneNumber:phonenumber.text
                   ));
            },
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
