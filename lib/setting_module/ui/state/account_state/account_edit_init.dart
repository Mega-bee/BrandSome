import 'dart:io';

import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/utils/helpers/image_crop_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/components/pickertime.dart';
import '../../../request/update_profile_request.dart';
import '../../../response/account_response.dart';
import '../../screen/account_info_screen.dart';

class EditAccountInit extends States {
  final Function onSaveClick;
  final AccountInfoScreenState screenState;
  final AccountResponse model;

  EditAccountInit(this.model,
      {required this.onSaveClick, required this.screenState})
      : super() {
    phoneNumber.text = model.phoneNumber ?? '';
    gender.text = model.gender ?? '';
    username.text = model.userName ?? '';
    birthday.text = model.birthDate ?? '';
    genderID = model.genderId ?? 3;
  }

  final _formKeyBusiness = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();
  final gender = TextEditingController();
  final birthday = TextEditingController();
  final username = TextEditingController();
  int? genderID;
  File? _pickImage;
  MultipartFile? imageForUpload;


  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKeyBusiness,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Center(
                  child: Stack(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                          child:_pickImage != null ?  Image.file(
                             _pickImage!,
                            fit: BoxFit.cover,
                            width: 150,height: 150
                          ) : Image.network(model.imageUrl ?? '',fit: BoxFit.cover,width: 150,height: 150,),

                      ),
                    ),
                    Positioned(
                        top: 130,
                        left: 110,
                        child: RawMaterialButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape:
                                                              StadiumBorder()),
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        await ImageCropHelper
                                                                .pickImageFromCamera()
                                                            .then(
                                                                (pickedFile) async {

                                                          if (pickedFile ==
                                                              null) return;
                                                          _pickImage = File(pickedFile.path) ;
                                                          imageForUpload =
                                                          await MultipartFile
                                                              .fromFile(
                                                              pickedFile
                                                                  .path);

                                                          screenState
                                                              .refresh();
                                                        });
                                                      },
                                                      child: Text('Camera')),
                                                ),
                                                Divider(
                                                  indent: 16,
                                                  endIndent: 16,
                                                  color: Theme.of(context)
                                                      .backgroundColor,
                                                  thickness: 2.5,
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape:
                                                              StadiumBorder()),
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        await ImageCropHelper
                                                            .pickImageFromGallery()
                                                            .then(
                                                                (pickedFile) async {

                                                              if (pickedFile ==
                                                                  null) return;
                                                              _pickImage = File(pickedFile.path) ;
                                                              imageForUpload =
                                                              await MultipartFile
                                                                  .fromFile(
                                                                  pickedFile
                                                                      .path);

                                                              screenState
                                                                  .refresh();
                                                            });
                                                      },
                                                      child: Text('Gallery')),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          elevation: 10,
                          fillColor: Theme.of(context).primaryColor,
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
              Text(
                "Username",
              ),
              TextFormField(
                autofocus: false,
                controller: username,
              ),
              SizedBox(height: 30),
              Text(
                "Phone number",
              ),
              TextFormField(
                autofocus: false,
                controller: phoneNumber,
                keyboardType: TextInputType.phone,
                readOnly: true,
              ),
              SizedBox(height: 30),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Gender',
                  ),
                ),
                subtitle: Flex(
//                  runSpacing: 50,
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: RadioListTile(
                          dense: true,
                          activeColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text('Male'),
                          value: 1,
                          groupValue: genderID,
                          onChanged: (int? v) {
                            genderID = v;
                            screenState.refresh();
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: RadioListTile(
                          dense: true,
                          activeColor: Theme.of(context).primaryColor,
                          title: Text('Female'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: 2,
                          groupValue: genderID,
                          onChanged: (int? v) {
                            genderID = v;
                            screenState.refresh();
                          },
                        ),
                      ),
                    ),

//                    Expanded(
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(10),
//                          color: Theme.of(context).cardColor,
//                        ),
//                        child: RadioListTile(
//                          activeColor: Theme.of(context).primaryColor,
//                          title: Text('Other'),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10)),
//                          value: 3,
//                          groupValue: genderID,
//                          onChanged: (int? v) {
//                            genderID =  v;
//                            screenState.refresh();
//                          },
//                        ),
//                      ),
//                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              DatePicker(
                controller: birthday,
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
                    PhoneNumber: phoneNumber.text,
                    Username: username.text,
                    genderId: genderID.toString(),
                    Birthday: birthday.toString(),
                    ImageFile: imageForUpload,
                  ));
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTRB(15 , 15 , 15 , 15);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}