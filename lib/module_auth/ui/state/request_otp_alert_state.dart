import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:flutter/material.dart';

class RequestOtpState extends States {
  dynamic screenState;
  RequestOtpState(this.screenState) : super(true);
  final username = TextEditingController();
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
                  "Username",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                      ),
                      hintText: 'Enter your username',
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                      contentPadding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
                const SizedBox(
                  height: 20,
                ),
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
              screenState.requestOtp(OtpRequest(
                  userName: username.text, number: phonenumber.text));
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
