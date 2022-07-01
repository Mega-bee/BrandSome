import 'package:brandsome/abstracts/states/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;
import '../../../../business_details_module/ui/state/BusinessDetailsSuccess.dart';
import '../../../../utils/components/picker.dart';
import '../../../../utils/components/pickertime.dart';
import '../../../request/update_profile_request.dart';
import '../../../response/account_response.dart';
import '../../../response/settings_response.dart';
import '../../../state_manager/account_state_manager.dart';
import '../../screen/account_info_screen.dart';
import 'account_success.dart';

class EditAccountInit extends States {
  final Function onSaveClick;
  final AccountInfoScreenState screenState;
   EditAccountInit({required this.onSaveClick,required this.screenState});





  final _formKeyBusiness = GlobalKey<FormState>();

  final phonenumber = TextEditingController();
  final gender = TextEditingController();
  final Birthday = TextEditingController();
final username = TextEditingController();
 i.File? _pickImage;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);
      this._pickImage = imageTemporary;
      screenState.Refrech(

      );
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

@override


  Widget getUI(BuildContext context) {
   print("USERNAME:${username}");
    return Form(
      key: _formKeyBusiness,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            end: 38.0, start: 27.0),
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
                      backgroundColor: Theme
                          .of(context)
                          .primaryColor,
                      child: CircleAvatar(
                          radius: 65,
//                          backgroundColor: whiteColor,
                          backgroundImage:NetworkImage("")
                      ),
                    ),),
                Positioned(
                    top: 110,
                    left: 95,
                    child: RawMaterialButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
//                                  backgroundColor: whiteColor,
                                title: Text("Choose option"),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pickImage(ImageSource.camera);
                                        },
                                        splashColor: Theme
                                            .of(context)
                                            .primaryColor,

                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.camera,
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
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
                                        splashColor: Theme
                                            .of(context)
                                            .primaryColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.image,
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
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
                      fillColor: Theme
                          .of(context)
                          .primaryColor,
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
            Text("Username"
              ,
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
            CustomCupertinoPicker(

              label: "Gender",



              // events: address.regular.events,
              selectedValue: 3,
              inputType: TextInputType.text,
              controller:gender, items: [
              "male",
              "female",
              "Rather not to say",

            ],
            ),
            SizedBox(height: 30),
            DatePicker(
              controller: Birthday,
              label: "Date Of Birth",
              read: true,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
            onSaveClick(UpdateProfileRequest(
                // Birthday: Birthday,
              PhoneNumber: phonenumber.text,
             Username: username.text,
              genderId: "1",
              Birthday:Birthday.toString(),
              ImageFile:_pickImage as MultipartFile ,




            ));

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
    );
  }
}