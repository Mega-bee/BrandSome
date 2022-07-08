import 'dart:io';

import 'package:dio/src/multipart_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../../abstracts/states/state.dart';
import '../../../business_module/business_routes.dart';
import '../../../categories_module/reponse/category_response.dart';
import '../../../setting_module/response/add_location_response.dart';
import '../../../home_page/home_route.dart';
import '../screen/createPost.dart';

class CreatePostSuccess extends States {
  CreatePostSuccess({required this.state}) : super(false);
  CreatePostState state;
  final _formKeyCreateBusiness = GlobalKey<FormState>();
  final description = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<ServiceModel> services = [];
  List<AddLocationResponse> selected = [];
  List<XFile> imageFileList = [];

  Future<List<XFile>?> selectedImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    return selectedImages;
  }

  @override
  Widget getUI(BuildContext context) {
    state.request.description = description.text;
    state.request.cityId = 1;
    state.request.serviceId =2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Form(
          key: _formKeyCreateBusiness,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(start: 25),
              hintText: "Write a caption",
              suffixIcon: IconButton(
                onPressed: () {
                  selectedImages().then((value) {
                    if (value == null) {
                    } else {
                      value.forEach((element) async {
                        imageFileList.add(element);
                        state.request.media
                            .add(await MultipartFile.fromFile(element.path));
                      });
                      print("media:"+ state.request.media.length.toString());
                    }

                    state.refrech();
                  });
                },
                icon: Icon(Icons.image),
              ),
            ),
            controller: description,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: imageFileList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Image.file(
                  File(imageFileList[index].path),
                  fit: BoxFit.cover,
                );
              }),
        ),
        // SizedBox(
        //   height: 20,
        // ),
        // TextButton(
        //   onPressed: () {
        //     Navigator.pushNamed(
        //             context, HomeRoutes.CATEGORY_LIST_SCREEN_ADD_POST)
        //         .then((returnedService) {
        //       services = returnedService as List<ServiceModel>;
        //       services.forEach((element) {
        //         ///send request id
        //         state.request.serviceId.add(element.id ?? 0);
        //       });
        //       state.refrech();
        //     });
        //     print("Services");
        //   },
        //   child: Text("Add Services"),
        // ),
        // SizedBox(
        //   height: 12,
        // ),
        // Wrap(
        //   spacing: 13,
        //   runSpacing: 30,
        //   children: services
        //       .map(
        //         (e) => Container(
        //           padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
        //           decoration: BoxDecoration(
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(
        //                 5), // radius of 10// green as background color
        //           ),
        //           child: Text(
        //             "${e.name}",
        //             style: TextStyle(
        //               color: Theme.of(context).scaffoldBackgroundColor,
        //             ),
        //           ),
        //         ),
        //       )
        //       .toList(),
        // ),
        // Divider(
        //   thickness: 1,
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // TextButton(
        //   onPressed: () {
        //     print("Pushed to location");
        //     Navigator.pushNamed(context, BusinessRoutes.ADD_LOCATION)
        //         .then((returnedLocation) {
        //       selected = returnedLocation as List<AddLocationResponse>;
        //       // selected.forEach((element) {
        //       //   state.request.cityId.add(element.id ?? 0);
        //       // });
        //       state.refrech();
        //     });
        //   },
        //   child: Text("Add Location"),
        // ),
        // SizedBox(
        //   height: 12,
        // ),
        // Wrap(
        //   spacing: 13,
        //   runSpacing: 30,
        //   children: selected
        //       .map(
        //         (e) => Container(
        //           padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
        //           decoration: BoxDecoration(
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(
        //                 5), // radius of 10// green as background color
        //           ),
        //           child: Text(
        //             "${e.name}",
        //             style: TextStyle(
        //               color: Theme.of(context).scaffoldBackgroundColor,
        //             ),
        //           ),
        //         ),
        //       )
        //       .toList(),
        // ),
        // Divider(
        //   thickness: 1,
        // ),
      ],
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
