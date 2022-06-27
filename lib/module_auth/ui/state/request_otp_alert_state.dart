import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/ui/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestOtpState extends States{
  final AuthScreenState screenState;


  RequestOtpState(this.screenState);

  final username = TextEditingController();
  final phonenumber = TextEditingController();
  @override
  Widget getUI(BuildContext    context) {
    return  AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,

            child: InkWell(
              onTap: (){
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
                Text(
                  "Username",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                ),
                SizedBox(
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
                      contentPadding: EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Phone Number",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
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
              screenState.requestOtp(OtpRequest(userName: '', number: ''));
            },
            child: Text("Continue"),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}