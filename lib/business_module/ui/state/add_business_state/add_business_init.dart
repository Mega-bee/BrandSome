import 'dart:io';
import 'dart:async';
import 'package:badges/badges.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/request/create_business_request.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:brandsome/categories_module/categories_routes.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import '../../../../categories_module/reponse/add_location_response.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import '../../../../generated/l10n.dart';
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
  final picker = ImagePicker();
  String? fileName;

  CreateBusinessRequest request =
      CreateBusinessRequest(cities: [], services: []);

  Future getImage(context) async {
    print("chrisssssssssssssssssssssssssssssssssssssssss");
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _pickImage = new File(pickedFile.path);
      fileName = basename(_pickImage!.path);
      var image = imageLib.decodeImage(await _pickImage!.readAsBytes());
      image = imageLib.copyResize(image!, width: 600);
      Map imagefile = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new PhotoFilterSelector(
            title: Text(
              S.of(context).photoFilter,
            ),
            image: image!,
            filters: presetFiltersList,
            filename: fileName!,
            appBarColor: Colors.black,
            loader: Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );

      if (imagefile != null && imagefile.containsKey('image_filtered')) {
        _pickImage = imagefile['image_filtered'];
        imageForUpload = await MultipartFile.fromFile(_pickImage!.path);
        addBusinessState.refresh();

        Navigator.pop(context);
      }
    }
  }

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 5,
        title: Text(
          S.of(context).addBussines,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: InkWell(
                onTap: () {
                  if (_formKeyBusiness.currentState!.validate()) {
                    if (imageForUpload != null) {
                      if (selectedServices.isNotEmpty &&
                          selectedLoca.isNotEmpty) {
                        request.businessDescription = description.text;
                        request.businessName = business.text;
                        request.businessPhoneNumber = phoneNumber.text;
                        request.images = imageForUpload;
                        for (var element in selectedLoca) {
                          request.cities.add(element.id ?? -1);
                        }
                        for (var element in selectedServices) {
                          request.services.add(element.id ?? -1);
                        }
                        addBusinessState.addBusinessRequest(request);
                      } else {
                        Fluttertoast.showToast(
                            msg: S.of(context).selectCitiesAndServices,
                            backgroundColor: Theme.of(context).errorColor);
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: S.of(context).selectImagePlease,
                          backgroundColor: Theme.of(context).errorColor);
                    }
                  }
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: _pickImage != null
                      ? Image.file(_pickImage!,
                          fit: BoxFit.cover, width: 150, height: 150)
                      : Image.network(
                          "https://img.myloview.com/posters/avatar-icon-with-question-mark-speech-bubble-symbol-vector-male-person-profile-for-help-in-a-flat-color-glyph-pictogram-illustration-400-218634845.jpg",
                          fit: BoxFit.cover,
                          width: 350,
                          height: 300,
                        ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 310,
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
                                                    shape:
                                                        const StadiumBorder()),
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
                                                child: Text(
                                                  S.of(context).Camera,
                                                )),
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
                                                  getImage(context).then(
                                                      (value) =>
                                                          print("helloooo"));
                                                },
                                                child: Text(
                                                  S.of(context).Gallery,
                                                )),
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
                    // fillColor: Theme.of(context).primaryColor,
                    child:  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
// radius of 10
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 80.0),
                    shape: const CircleBorder(),
                  ))
            ]),
          ),
          const SizedBox(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isEmpty ? "fill the field" : null,
                  ),
                  SizedBox(height: 30),
                  Text(
                    S.of(context).Description,
                  ),
                  TextFormField(
                    controller: description,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isEmpty ? S.of(context).fillTheField : null,
                  ),
                  SizedBox(height: 30),
                  Text(
                    S.of(context).businessPhone,
                  ),
//                  TextFormField(
//                    controller: phoneNumber,
//                    autovalidateMode: AutovalidateMode.onUserInteraction,
//                    validator: (value) =>
//                    value!.isEmpty ? "fill the field" : null,
//                  ),

                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumber,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 8,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? S.of(context).fillTheField : null,
                  ),
                  const SizedBox(height: 20),
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
                        children: selectedLoca
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  selectedLoca.remove(e);
                                  addBusinessState.refresh();
                                },
                                child: Badge(
                                  shape: BadgeShape.circle,
                                  badgeContent: const Icon(
                                    Icons.cancel,
                                    size: 18,
                                  ),
                                  badgeColor: Colors.transparent,
                                  position: BadgePosition.topEnd(top: -15),
                                  stackFit: StackFit.passthrough,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 3, 15, 3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          5), // radius of 10// green as background color
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "${e.name}",
                                        style: const TextStyle(
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
                  // IconButton( onPressed: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => MyApp(),
                  //   ));
                  // }, icon: Icon(Icons.height,color: Colors.white,)),
                  // SERVICE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context,
                                  CategoriesRoutes.CATEGORY_LIST_SCREEN)
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
                              Text(
                                S.of(context).addService,
                              ),
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
                                  badgeContent: const Icon(
                                    Icons.cancel,
                                    size: 18,
                                  ),
                                  badgeColor: Colors.transparent,
                                  position: BadgePosition.topEnd(top: -15),
                                  stackFit: StackFit.passthrough,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 3, 15, 3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          5), // radius of 10// green as background color
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "${e.name}",
                                        style: const TextStyle(
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
