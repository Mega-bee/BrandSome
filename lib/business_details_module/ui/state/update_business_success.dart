import 'dart:io';

import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/setting_module/response/add_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/image_crop_helper.dart';
import '../../../business_module/reponse/business_response.dart';
import '../../reponse/business_response.dart';
import '../screen/update_business.dart';

class UpdateBusinessSuccess extends States {
  final UpdateBusinessState updateBusinessState;
  final BusinessInfoResponse businessInfoResponse;


  UpdateBusinessSuccess(
    this.updateBusinessState,this.businessInfoResponse,
  ) : super(false){
    business.text = businessInfoResponse.name ?? '';
    description.text = businessInfoResponse.description ?? '';
    phoneNumber.text = businessInfoResponse.phoneNumber ?? '';
    // services = businessInfoResponse.services;
  }

  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();
  final phoneNumber = TextEditingController();
  List<AddLocationResponse> selected = [];
  List<ServiceModel> services = [];
  File? _pickImage;
  MultipartFile? imageForUpload;

  @override
  Widget getUI(BuildContext context) {
    updateBusinessState.request.businessDescription = description.text;
    updateBusinessState.request.businessName = business.text;
    updateBusinessState.request.businessPhoneNumber = phoneNumber.text;
    updateBusinessState.request.images = imageForUpload;

    return ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: _pickImage != null
                    ? Image.file(_pickImage!,
                        fit: BoxFit.cover, width: 150, height: 150)
                    : Image.network(
                        "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png",
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
                                      borderRadius: BorderRadius.circular(25),
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
                                                  shape: StadiumBorder()),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await ImageCropHelper
                                                        .pickImageFromCamera()
                                                    .then((pickedFile) async {
                                                  if (pickedFile == null)
                                                    return;
                                                  _pickImage =
                                                      File(pickedFile.path);
                                                  imageForUpload =
                                                      await MultipartFile
                                                          .fromFile(
                                                              pickedFile.path);

                                                  updateBusinessState.refresh();
                                                });
                                              },
                                              child: Text('Camera')),
                                        ),
                                        Divider(
                                          indent: 16,
                                          endIndent: 16,
                                          color:
                                              Theme.of(context).backgroundColor,
                                          thickness: 2.5,
                                        ),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  shape: StadiumBorder()),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await ImageCropHelper
                                                        .pickImageFromGallery()
                                                    .then((pickedFile) async {
                                                  if (pickedFile == null)
                                                    return;
                                                  _pickImage =
                                                      File(pickedFile.path);
                                                  imageForUpload =
                                                      await MultipartFile
                                                          .fromFile(
                                                              pickedFile.path);

                                                  updateBusinessState.refresh();
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
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    print("Pushed to location");
                    Navigator.pushNamed(context, BusinessRoutes.ADD_LOCATION)
                        .then((returnedLocation) {
                      selected = returnedLocation as List<AddLocationResponse>;
                      selected.forEach((element) {
                        updateBusinessState.request.cities.add(element.id ?? 0);
                      });
                      updateBusinessState.refresh();
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
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(
                                5), // radius of 10// green as background color
                          ),
                          child: Text(
                            "${e.name}",
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Divider(
                  thickness: 3,
                  height: 2,
                ),
                TextButton(
                  onPressed: () {
                    print("Pushed to service");
                    Navigator.pushNamed(
                            context, CategoriesRoutes.CATEGORY_LIST_SCREEN)
                        .then((returnedService) {
                      services = returnedService as List<ServiceModel>;
                      services.forEach((element) {
                        updateBusinessState.request.services
                            .add(element.id ?? 0);
                      });
                      updateBusinessState.refresh();
                    });
                  },
                  child: Text(
                    "Add Service",
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 13,
                  runSpacing: 30,
                  children: services
                      .map(
                        (e) => Container(
                          padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(
                                5), // radius of 10// green as background color
                          ),
                          child: Text(
                            "${e.name}",
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
