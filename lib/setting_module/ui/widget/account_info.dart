import 'dart:io' as i;
import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/style/colors.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  i.File? _pickImage;
  final _formKeyBusiness = GlobalKey<FormState>();
  final username = TextEditingController();

  final phonenumber = TextEditingController();
  final gender = TextEditingController();
  final Birthday = TextEditingController();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);
      setState(() {
        this._pickImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  edit = true;
                });
              },
              icon: Icon(
                Icons.edit,
                color: whiteColor,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Account info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Stack(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: CircleAvatar(
                      radius: 66,
                      backgroundColor: primaryColor,
                      child: CircleAvatar(
                          radius: 65,
                          backgroundColor: whiteColor,
                          backgroundImage: _pickImage == null
                              ? null
                              : FileImage(_pickImage!)),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      left: 95,
                      child: RawMaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: whiteColor,
                                  title: Text("Choose option"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.camera);
                                          },
                                          splashColor: primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.camera,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          splashColor: primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.image,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        elevation: 10,
                        fillColor: primaryColor,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ))
                ]),
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
                            "Username",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            readOnly: true,
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: username,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Phone number",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            readOnly: true,
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: phonenumber,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Gender",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            readOnly: true,
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: gender,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Birthday",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            readOnly: true,
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: Birthday,
                            decoration: InputDecoration(
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
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
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: username,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Phone number",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: phonenumber,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Gender",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: gender,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Birthday",
                            style: TextStyle(color: greyColor, fontSize: 13),
                          ),
                          TextFormField(
                            style: TextStyle(color: hintText, fontSize: 15),
                            controller: Birthday,
                            decoration: InputDecoration(
                              // hintText: "username",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),

                              // keyboardType: TextInputType.
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                edit=false;
                              });
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: primaryColor,
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
                    builder: (context) => CustomDeleteDialog(
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
                      color: primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ), // SizedBox(height: 200,),
          ],
        ),
      ),
    );
  }
}
