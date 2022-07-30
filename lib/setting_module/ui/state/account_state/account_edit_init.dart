import 'dart:io';

import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/utils/helpers/image_crop_helper.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../generated/l10n.dart';
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
  Country? countrycode;

  @override
  Widget getUI(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          S.of(context).editAccount,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: InkWell(
                onTap: () {
                  screenState.updateProfile(UpdateProfileRequest(
                     countryCode: countrycode!.phoneCode,
                      genderId: genderID.toString(),
                      Birthday: birthDate?.toIso8601String(),
                      PhoneNumber:
                      screenState.newNumber.text.isNotEmpty ?
                      screenState.newNumber.text:phoneNumber.text,
                      Username: username.text,
                      ImageFile:
                      imageForUpload));
                },
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )),
          )
        ],
      ),
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
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                                                        child: Text(S.of(context).Camera)),
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
                                                        child: Text(S.of(context).Gallery)),
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
                            child: const Icon(

                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(),
                          ))
                    ]),
                  ),
                ),
                Text(
                  S.of(context).userName,
                ),
                TextFormField(

                  autofocus: false,
                  controller: username,
                ),
                SizedBox(height: 30),
                Text(
                  S.of(context).phoneNumber,
                ),
                // Column(
                //   children:[ Wrap(
                //     children:[
                //       ElevatedButton(
                //     onPressed: () {
                //       showCountryPicker(
                //         context: context,
                //         //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                //         exclude: <String>['KN', 'MF'],
                //         favorite: <String>['SE'],
                //         //Optional. Shows phone code before the country name.
                //         showPhoneCode: true,
                //         onSelect: (Country country) {
                //           print('Select country: ${country.displayName}');
                //         },
                //         // Optional. Sets the theme for the country list picker.
                //         countryListTheme: CountryListThemeData(
                //           // Optional. Sets the border radius for the bottomsheet.
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(40.0),
                //             topRight: Radius.circular(40.0),
                //           ),
                //           // Optional. Styles the search field.
                //           inputDecoration: InputDecoration(
                //             labelText: 'Search',
                //             hintText: 'Start typing to search',
                //             prefixIcon: const Icon(Icons.search),
                //             border: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: const Color(0xFF8C98A8).withOpacity(0.2),
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     child: Text('Country picker'),
                //     ),


                screenState.newNumber.text.isNotEmpty ?TextFormField(
                  decoration:
                  InputDecoration(
                    isDense: true,
                    prefixIcon: ElevatedButton(

                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                          exclude: <String>['KN', 'MF'],
                          favorite: <String>['SE'],
                          //Optional. Shows phone code before the country name.
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            countrycode=country;
                            screenState.refresh();
                            Text('Select country: ${country.displayName}');
                          },
                          // Optional. Sets the theme for the country list picker.
                          countryListTheme: CountryListThemeData(
                            // Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child:
                      countrycode==null?Wrap(children:[ Text("Country"),
                        Icon(Icons.arrow_drop_down_outlined)
                      ]):
                      Text('+${countrycode!.phoneCode}',style: TextStyle(color: Theme.of(context).primaryColor),),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  ),


                  autofocus: false,
                  controller: screenState.newNumber,
                  keyboardType: TextInputType.phone,
                  readOnly: true,

                ) :  TextFormField(
                  decoration:
                  InputDecoration(
                    isDense: true,

                    prefixIcon: ElevatedButton(

                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                          exclude: <String>['KN', 'MF'],
                          // favorite: <String>['LB'],
                          //Optional. Shows phone code before the country name.
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            countrycode=country;
                            screenState.refresh();
                            Text('Select country: ${country.displayName}');
                          },
                          // Optional. Sets the theme for the country list picker.
                          countryListTheme: CountryListThemeData(
                            // Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child:
                      countrycode==null?Wrap(children:[ Text("Country",style: TextStyle(color: Theme.of(context).primaryColor)),
                        Icon(Icons.arrow_drop_down_outlined)
                      ]):
                      Text('+${countrycode!.phoneCode}',style: TextStyle(color: Theme.of(context).primaryColor),),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  ),
                  onTap: (){
                    screenState.gotoNumberAlert();
                  },
                  autofocus: false,

                  controller: phoneNumber,
                  keyboardType: TextInputType.phone,
                  readOnly: false,

                ),



                // const SizedBox(height: 10),
                // screenState.newNumber.text.isNotEmpty ?
                //  Text(S.of(context).sendOtpToVerify,style: TextStyle(fontSize: 10,color: Colors.green,),):
                // Container()
                // ,

                const SizedBox(height: 30),

                InkWell(
                  onTap: (){
                    showDatePicker(
                        context: context,
                        builder: (context, widget) {
                          return widget ?? const SizedBox();
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
                        S.of(context).birthdayDate,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                          birthDate != null ?
                          birthDate.toString().split(' ').first :
                          birthday.text
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),

                Divider(height: 2,thickness: 3,color: Theme.of(context).dividerColor,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).Gender,
                ),
                Row(
                    children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      dense: true,
                      toggleable: true,
                      contentPadding:  EdgeInsets.zero,
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text(
                        S.of(context).Male,
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
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      dense: true,
                      toggleable: true,
                      activeColor: Theme.of(context).primaryColor,
                      contentPadding:  EdgeInsets.zero,
                      title: Text(
                        S.of(context).Female,
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
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      dense: true,
                      toggleable: true,
                      contentPadding:  EdgeInsets.zero,
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text(
                        S.of(context).ratherNotToSay,
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
                ]),
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
