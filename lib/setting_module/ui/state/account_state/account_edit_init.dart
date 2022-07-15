import 'dart:io';

import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/utils/helpers/image_crop_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../utils/components/pickertime.dart';
import '../../../request/update_profile_request.dart';
import '../../../response/account_response.dart';
import '../../screen/account_info_screen.dart';

class EditAccountInit extends States {
  final AccountInfoScreenState screenState;
  final AccountResponse model;

  EditAccountInit(this.model,
      { required this.screenState})
      : super(false) {
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
  DateTime?   birthDate;
  int? genderID;
  File? _pickImage;
  MultipartFile? imageForUpload;

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit account'),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: InkWell(
                onTap: () {
                  screenState.updateProfile(UpdateProfileRequest(
                      genderId: genderID.toString(),
                      Birthday: birthDate?.toIso8601String(),
                      PhoneNumber: phoneNumber.text,
                      Username: username.text,
                      ImageFile: imageForUpload !=null ? imageForUpload :null
                  ));
                },
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )),
          )

      ],),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
                          child: _pickImage != null
                              ? Image.file(_pickImage!,
                                  fit: BoxFit.cover, width: 150, height: 150)
                              : Image.network(
                                  model.imageUrl ?? '',
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
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
                                                    .dialogBackgroundColor),
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
                                                            _pickImage = File(
                                                                pickedFile.path);
                                                            imageForUpload =
                                                                await MultipartFile
                                                                    .fromFile(
                                                                        pickedFile
                                                                            .path);

                                                            screenState.refresh();
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
                                                            _pickImage = File(
                                                                pickedFile.path);

                                                            imageForUpload =
                                                                await MultipartFile
                                                                    .fromFile(
                                                                        pickedFile
                                                                            .path);

                                                            screenState.refresh();
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
              screenState.newNumber.text.isNotEmpty ?TextFormField(
                autofocus: false,
                controller: screenState.newNumber,
                keyboardType: TextInputType.phone,
                readOnly: true,

              ) :  TextFormField(
                  autofocus: false,
                  controller: phoneNumber,
                  keyboardType: TextInputType.phone,
                  readOnly: false,

                ),
                TextButton(onPressed: (){
                 screenState.gotoNumberAlert();

                }, child: Text("Send Otp to verify",style: TextStyle(fontSize: 10,color: Theme.of(context).primaryColor,decoration: TextDecoration.underline),)),

                SizedBox(height: 30),

                InkWell(
                  onTap: (){
                    showDatePicker(
                      context: context,
                      builder: (context, widget) {
                        return widget ?? SizedBox();
                      },
                      firstDate: DateTime(1995),
                      lastDate: DateTime.now(),
                      initialDate:DateTime(1995)
                    ).then((value) {
                      if (value == null) {

                      } else {
                        DateTime DOB = value;
                          birthDate = DateTime(DOB.year, DOB.month,
                            DOB.day);
                        screenState.refresh();
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Birthday Date",
                      ),
                      SizedBox(height: 10,),
                      Text(
                 birthDate != null ?
                         birthDate.toString().split(' ').first :
                         birthday.text
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),

                Divider(height: 2,thickness: 3,color: Theme.of(context).dividerColor,),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Gender',
                    ),
                  ),
                  subtitle: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            dense: true,
                            activeColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              'Male',
                              style: TextStyle(fontSize: 12),
                            ),
                            value: 1,
                            groupValue: genderID,
                            onChanged: (int? v) {
                              genderID = v;
                              screenState.refresh();
                            },
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            dense: true,
                            activeColor: Theme.of(context).primaryColor,
                            title: Text(
                              'Female',
                              style: TextStyle(fontSize: 12),
                            ),
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
                        SizedBox(height: 30),
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            dense: true,
                            activeColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              'Rather not to say',
                              style: TextStyle(fontSize: 12),
                            ),
                            value: 3,
                            groupValue: genderID,
                            onChanged: (int? v) {
                              genderID = v;
                              screenState.refresh();
                            },
                          ),
                        ),
                        SizedBox(height: 30),

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
                  ]),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
