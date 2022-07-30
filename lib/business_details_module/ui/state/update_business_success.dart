import 'dart:io';
import 'package:badges/badges.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_details_module/reponse/business_detailes_response.dart';
import 'package:brandsome/business_details_module/request/edit_business_request.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../categories_module/reponse/add_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../utils/helpers/image_crop_helper.dart';
import '../../../generated/l10n.dart';
import '../screen/update_business.dart';

class UpdateBusinessSuccess extends States {
  final UpdateBusinessState updateBusinessState;
  final BusinessInfoResponse businessInfoResponse;

  UpdateBusinessSuccess(
    this.updateBusinessState,
    this.businessInfoResponse,
  ) : super(false) {
    business.text = businessInfoResponse.name ?? '';
    description.text = businessInfoResponse.description ?? '';
    phoneNumber.text = businessInfoResponse.phoneNumber ?? '';
     services = businessInfoResponse.services ?? [];
     cities = businessInfoResponse.cities ?? [];
  }

  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();
  final phoneNumber = TextEditingController();
  List<AddLocationResponse> selected = [];
  List<Service> services = [];
  List<City> cities = [];
  File? _pickImage;
  MultipartFile? imageForUpload;
  EditBusinessRequest request = EditBusinessRequest(services: [], cities: []);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
            S.of(context).editBusiness,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                  onPressed: () {


                    request.businessDescription = description.text;
                    request.businessName = business.text;
                    request.businessPhoneNumber = phoneNumber.text;
                    request.id = businessInfoResponse.id ?? -1;

                    if (imageForUpload != null) {
                      request.images = imageForUpload;
                    }
                    for (var element in cities) {
                      request.cities.add(element.id ?? -1);
                    }
                    for (var element in services) {
                      request.services.add(element.id ?? -1);
                    }
                    updateBusinessState.editBusiness(request);

                  },
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ))),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: _pickImage != null
                      ? Image.file(_pickImage!,
                          fit: BoxFit.cover, width: 150, height: 150)
                      : Image.network(
                          businessInfoResponse.image ?? '',
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
                                            .dialogBackgroundColor),
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

                                                    updateBusinessState
                                                        .refresh();
                                                  });
                                                },
                                                child: Text(S.of(context).Camera,)),
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

                                                    updateBusinessState
                                                        .refresh();
                                                  });
                                                },
                                                child: Text(S.of(context).Gallery,)),
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
                      S.of(context).businessName,
                  ),
                  TextFormField(
                    controller: business,
                  ),
                  SizedBox(height: 30),
                  Text(
                      S.of(context).Description,
                  ),
                  TextFormField(
                    controller: description,
                  ),
                  SizedBox(height: 30),
                  Text(
                      S.of(context).businessPhone,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumber,
                    maxLength: 8,
                  ),
                  const SizedBox(height: 10),
                  // CITY
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
//                          Navigator.pushNamed(
//                              context, CategoriesRoutes.CITY_LIST_SCREEN,
//                              arguments: selectedLoca)
//                              .then((returnedLocation) {
//                            selectedLoca =
//                            returnedLocation as List<AddLocationResponse>;
//                            addBusinessState.refresh();
//                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).addLocation),
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
                        children: cities
                            .map(
                              (e) => InkWell(
                            onTap: () {
//                              selectedLoca.remove(e);
//                              addBusinessState.refresh();
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
                      const SizedBox(height: 20),
                      const Divider(
                        thickness: 3,
                        height: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // SERVICE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
//                          Navigator.pushNamed(
//                              context, CategoriesRoutes.CATEGORY_LIST_SCREEN)
//                              .then((returnedService) {
//                            selectedServices =
//                            returnedService as List<ServiceModel>;
//                            addBusinessState.refresh();
//                          });
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).addService),
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
                        children: services
                            .map(
                              (e) => InkWell(
                            onTap: () {
//                              selectedServices.remove(e);
//                              addBusinessState.refresh();
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
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
