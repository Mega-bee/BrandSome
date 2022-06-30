import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBusinessInit extends States{
  final AddBusinessState _addBusinessState;
  AddBusinessInit(this._addBusinessState,);

  final _formKeyBusiness = GlobalKey<FormState>();
  final business = TextEditingController();
  final description = TextEditingController();



  @override
  Widget getUI(BuildContext context) {
    _addBusinessState.request.BusinessDescription = description.text;
    _addBusinessState.request.BusinessName = business.text;

    return SingleChildScrollView(
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
                      title: Text("Choose option"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            InkWell(
                              onTap: () {
//                                pickImage(ImageSource.camera);
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.camera,
                                      color: Theme.of(context).primaryColor,
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
                                _addBusinessState.pickImage(ImageSource.gallery).then((value) {
                                  _addBusinessState.request.images = value;

                                });
                              },
                              splashColor: Theme.of(context).primaryColor,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Theme.of(context).primaryColor,
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
                      image: _addBusinessState.image != null
                          ? FileImage(_addBusinessState.image!)
                          : AssetImage("") as ImageProvider,
                      fit: BoxFit.cover,
                    ),

                  ),
                  width: 350,
                  height: 300,
                ),
                Positioned(
                    top: 120,
                    left: 140,
                    child: _addBusinessState.image == null
                        ? Icon(
                      Icons.camera_alt,
                      size: 80,
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
                  ),
                  TextFormField(
                    controller: business,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide( width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle( fontSize: 15),
                    controller: description,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide( width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),

                      // keyboardType: TextInputType.
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => AddLocationScreen()),
//                      ).then(
//                            (returnedLocation) {
//                          selectedLocation = returnedLocation;
//                          setState(() {});
//                        },
//                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 38.0),
                      child: Text(
                        "Add location",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
//                  Wrap(
//                    spacing: 13,
//                    runSpacing: 30,
//                    children: selectedLocation
//                        .map(
//                          (e) => Container(
//                        padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
//                        decoration: BoxDecoration(
//                          color: Color(0xff262626),
//                          borderRadius: BorderRadius.circular(
//                              5), // radius of 10// green as background color
//                        ),
//                        child: Text(
//                          "${e.name}",
//                          style: TextStyle(
//                            fontSize: 11, color: Theme.of(context).primaryColor,),
//                        ),
//                      ),
//                    )
//                        .toList(),
//                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 1,

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