import 'dart:io';

import 'package:badges/badges.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/business_routes.dart';
import 'package:brandsome/business_module/request/create_business_request.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../categories_module/reponse/add_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/image_crop_helper.dart';

class AddBusinessInit extends States {
  final AddBusinessState addBusinessState;
  AddBusinessInit(
    this.addBusinessState,
  ) : super(false);

  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();
  final phoneNumber = TextEditingController();
  List<AddLocationResponse> selectedLoca = [];
  List<ServiceModel> selectedServices = [];
  File? _pickImage;
  MultipartFile? imageForUpload;

  CreateBusinessRequest request =
      CreateBusinessRequest(cities: [], services: []);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Add Business'),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: InkWell(
                onTap: () {
                  request.businessDescription = description.text;
                  request.businessName = business.text;
                  request.businessPhoneNumber = phoneNumber.text;
                  request.images = imageForUpload;
                  selectedLoca.forEach(
                      (element) => request.cities.add(element.id ?? -1));
                  selectedServices.forEach(
                          (element) => request.services.add(element.id ?? -1));
                  addBusinessState.addBusinessRequest(request);
                },
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
                                                            .fromFile(pickedFile
                                                                .path);

                                                    addBusinessState.refresh();
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
                                                            .fromFile(pickedFile
                                                                .path);

                                                    addBusinessState.refresh();
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
                    autofocus: false,
                  ),
                  SizedBox(height: 20),
                  // CITY
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                                  context, CategoriesRoutes.CITY_LIST_SCREEN,
                                  arguments: selectedLoca)
                              .then((returnedLocation) {
                            selectedLoca =
                                returnedLocation as List<AddLocationResponse>;
                            addBusinessState.refresh();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add Location'),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 13,
                        runSpacing: 30,
                        children: selectedLoca
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  selectedLoca.remove(e);
                                  addBusinessState.refresh();
                                },
                                child: Badge(
                                  shape: BadgeShape.circle,
                                  badgeContent: Icon(
                                    Icons.cancel,
                                    size: 18,
                                  ),
                                  badgeColor: Colors.transparent,
                                  position: BadgePosition.topEnd(top: -15),
                                  stackFit: StackFit.passthrough,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          5), // radius of 10// green as background color
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "${e.name}",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        thickness: 3,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // SERVICE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CategoriesRoutes.CATEGORY_LIST_SCREEN)
                              .then((returnedService) {
                            selectedServices =
                            returnedService as List<ServiceModel>;
                            addBusinessState.refresh();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add Service'),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 13,
                        runSpacing: 30,
                        children: selectedServices
                            .map(
                              (e) => InkWell(
                            onTap: () {
                              selectedServices.remove(e);
                              addBusinessState.refresh();
                            },
                            child: Badge(
                              shape: BadgeShape.circle,
                              badgeContent: Icon(
                                Icons.cancel,
                                size: 18,
                              ),
                              badgeColor: Colors.transparent,
                              position: BadgePosition.topEnd(top: -15),
                              stackFit: StackFit.passthrough,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      5), // radius of 10// green as background color
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${e.name}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        thickness: 3,
                        height: 2,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
