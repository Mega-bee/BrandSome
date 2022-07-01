import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../abstracts/states/state.dart';
import '../../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../response/account_response.dart';




class AccountSuccess extends States {
  final Account getacc;

  AccountSuccess({required this.getacc});


  final _formKeyBusiness = GlobalKey<FormState>();
  final username = TextEditingController();

  final phonenumber = TextEditingController();
  final gender = TextEditingController();
  final Birthday = TextEditingController();



  bool edit = false;

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Stack(children: [
                Container(
                width: 130,
                height: 130,
                child: CachedNetworkImage(
                  imageUrl: getacc.imageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),]),
            ),
          ),

          !edit
              ? Form(
            key: _formKeyBusiness,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 38.0, start: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getacc.userName.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  TextFormField(
                    readOnly: true,
//                            style: TextStyle(color: hintText, fontSize: 15),
                    controller: username,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    getacc.phoneNumber.toString(),
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    readOnly: true,
                    style: TextStyle(fontSize: 15),
                    controller: phonenumber,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 30),
                  Text(
                    getacc.gender.toString(),
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    readOnly: true,
                    style: TextStyle(fontSize: 15),
                    controller: gender,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    getacc.birthDate.toString(),
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    readOnly: true,
                    style: TextStyle(fontSize: 15),
                    controller: Birthday,
                    decoration: InputDecoration(

                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                ],
              ),
            ),
          )
              : Form(
            key: _formKeyBusiness,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 38.0, start: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15),
                    controller: username,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Phone number",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15),
                    controller: phonenumber,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15),
                    controller: gender,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Birthday",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15),
                    controller: Birthday,
                    decoration: InputDecoration(
                      // hintText: "username",
                      // hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   edit = false;
                      // });
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      CustomDeleteDialog(
                        title: "Delete account",
                        content: "",
                        yesBtn: () {
                          Navigator.pop(context);
                        },
                        noBtn: () {
                          Navigator.pop(context);
                        },
                      ),
                );
              },
              child: Text(
                "Delete account",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ), // SizedBox(height: 200,),
        ],
      ),
    );
  }
}