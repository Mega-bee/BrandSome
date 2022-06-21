import 'package:brandsome/home_page/ui/widgets/searbarfilter_screen.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/colors.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' as i;

import 'package:image_picker/image_picker.dart';

import '../../model/add_location_model.dart';
import 'add_location.dart';

class AddBusiness extends StatefulWidget {
  const AddBusiness({Key? key}) : super(key: key);

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  i.File? _pickImage;
  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);
      setState(() {
        this._pickImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  List<AddLocationModel> selectedLocation = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        title: Text("Add business"),
        // centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.check,
                    color: primaryColor,
                    size: 30,
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: whiteColor,
                        title: Text("Choose option"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              InkWell(
                                onTap: () {
                                  pickImage(ImageSource.camera);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.camera,
                                        color: primaryColor,
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
                                splashColor: primaryColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.image,
                                        color: primaryColor,
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
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _pickImage != null
                            ? FileImage(_pickImage!)
                            : AssetImage("") as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                      color: borderColor,
                    ),
                    width: 350,
                    height: 300,
                  ),
                  Positioned(
                      top: 120,
                      left: 140,
                      child: _pickImage == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 80,
                              color: whiteColor,
                            )
                          : Container())
                ],
              ),
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
                      style: TextStyle(color: whiteColor, fontSize: 13),
                    ),
                    TextFormField(
                      style: TextStyle(color: hintText, fontSize: 15),
                      controller: business,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left: 20),
                        // hintText: "username",
                        // hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),

                        // keyboardType: TextInputType.
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        "Description",
                        style: TextStyle(color: whiteColor, fontSize: 13),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: hintText, fontSize: 15),
                      controller: description,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),

                        // keyboardType: TextInputType.
                      ),
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddLocationScreen()),
                        ).then(
                          (returnedLocation) {
                            selectedLocation = returnedLocation;
                            setState(() {});
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 38.0),
                        child: Text(
                          "Add location",
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Wrap(
                      spacing: 13,
                      runSpacing: 30,
                      children: selectedLocation
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                              decoration: BoxDecoration(
                                color: Color(0xff262626),
                                borderRadius: BorderRadius.circular(
                                    5), // radius of 10// green as background color
                              ),
                              child: Text(
                                "${e.name}",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 11),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      thickness: 1,
                      color: borderColor,
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBarFilterScreen()),
                        );
                      },
                      child: Text(
                        "Add services",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: borderColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
