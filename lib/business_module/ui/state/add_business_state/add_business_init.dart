import 'dart:io';

import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/setting_module/response/add_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/image_crop_helper.dart';

class AddBusinessInit extends States {
  final AddBusinessState addBusinessState;
  AddBusinessInit(
    this.addBusinessState,this.state
  );

  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();
  final phoneNumber = TextEditingController();
  List<AddLocationResponse> selected = [];
  AddBusinessState state;
  File? _pickImage;
  MultipartFile? imageForUpload;




  @override
  Widget getUI(BuildContext context) {
    addBusinessState.request.businessDescription = description.text;
    addBusinessState.request.businessName = business.text;
    addBusinessState.request.businessPhoneNumber = phoneNumber.text;
    addBusinessState.request.images = imageForUpload;
    addBusinessState.request.services = [1, 2];

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
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
                  ) :
                  Image.network("https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png" ?? '',fit: BoxFit.cover,width: 150,height: 150,),

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

                                                        state
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

                                                        state
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
//           InkWell(
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Choose option"),
//                       content: SingleChildScrollView(
//                         child: ListBody(
//                           children: [
//                             InkWell(
//                               onTap: () {
// //                                pickImage(ImageSource.camera);
//                               },
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.camera,
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Camera",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 _addBusinessState.pickImage(ImageSource.gallery).then((value) {
//                                   _addBusinessState.request.images = value;
//
//                                 });
//                               },
//                               splashColor: Theme.of(context).primaryColor,
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.image,
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Gallery",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             },
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: _addBusinessState.image != null
//                           ? FileImage(_addBusinessState.image!)
//                           : AssetImage("") as ImageProvider,
//                       fit: BoxFit.cover,
//                     ),
//
//                   ),
//                   width: 350,
//                   height: 300,
//                 ),
//                 Positioned(
//                     top: 120,
//                     left: 140,
//                     child: _addBusinessState.image == null
//                         ? Icon(
//                       Icons.camera_alt,
//                       size: 80,
//                     )
//                         : Container())
//               ],
//             ),
//           ),
          SizedBox(
            height: 50,
          ),
          Form(
            key: _formKeyBusiness,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business Name",
                  ),
                  TextFormField(
                    controller: business,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Description",
                  ),
                  TextFormField(
                    controller: description,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Business Phone",
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumber,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      print("Pushed to location");
                      Navigator.pushNamed(context, BusinessRoutes.ADD_LOCATION)
                          .then((returnedLocation) {
                        selected =
                            returnedLocation as List<AddLocationResponse>;
                        selected.forEach((element) {
                          addBusinessState.request.cities.add(element.id ?? 0);
                        });
                        addBusinessState.refresh();
                      });
                    },
                    child: Text(
                      "Add location",
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    spacing: 13,
                    runSpacing: 30,
                    children: selected
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                  5), // radius of 10// green as background color
                            ),
                            child: Text(
                              "${e.name}",
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SearchBarFilterScreen()),
                      // );
                    },
                    child: Text(
                      "Add services",
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
