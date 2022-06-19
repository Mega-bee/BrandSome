import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

import '../../model/add_location_model.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  List<AddLocationModel> loca = [
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
    AddLocationModel(
      name: "Zahle",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          leading: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.check,
                      color: primaryColor,
                    )))
          ],
        ),
        body: ListView.builder(
            itemCount: loca.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 15.0),
                    child: Text(
                      "${loca[index].name}",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 15.0, end: 15),
                    child: Divider(
                      thickness: 1,
                      color: darkWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              );
            }));
  }
}
