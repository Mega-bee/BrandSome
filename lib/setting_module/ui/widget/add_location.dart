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
      value: false,
    ),
    AddLocationModel(
      name: "Lebanon",
      value: false,
    ),
    AddLocationModel(
      name: "Canada",
      value: false,
    ),
    AddLocationModel(
      name: "America",
      value: false,
    ),
    AddLocationModel(
      name: "Kamal",
      value: false,
    ),
    AddLocationModel(
      name: "Mahfouz",
      value: false,
    ),
    AddLocationModel(
      name: "Hadi",
      value: false,
    ),
    AddLocationModel(
      name: "Chris",
      value: false,
    ),
    AddLocationModel(
      name: "Peter",
      value: false,
    ),
    AddLocationModel(
      name: "Walid",
      value: false,
    ),
    AddLocationModel(
      name: "Jad",
      value: false,
    ),
    AddLocationModel(
      name: "David",
      value: false,
    ),
    AddLocationModel(
      name: "Ibtissam",
      value: false,
    ),
    AddLocationModel(
      name: "Kimz",
      value: false,
    ),
    AddLocationModel(
      name: "Maho",
      value: false,
    ),
  ];
  List<AddLocationModel> location = [
    AddLocationModel(
      name: "Zahle",
      value: false,
    ),
    AddLocationModel(
      name: "Lebanon",
      value: false,
    ),
    AddLocationModel(
      name: "Canada",
      value: false,
    ),
    AddLocationModel(
      name: "America",
      value: false,
    ),
    AddLocationModel(
      name: "Kamal",
      value: false,
    ),
    AddLocationModel(
      name: "Mahfouz",
      value: false,
    ),
    AddLocationModel(
      name: "Hadi",
      value: false,
    ),
    AddLocationModel(
      name: "Chris",
      value: false,
    ),
    AddLocationModel(
      name: "Peter",
      value: false,
    ),
    AddLocationModel(
      name: "Walid",
      value: false,
    ),
    AddLocationModel(
      name: "Jad",
      value: false,
    ),
    AddLocationModel(
      name: "David",
      value: false,
    ),
    AddLocationModel(
      name: "Ibtissam",
      value: false,
    ),
    AddLocationModel(
      name: "Kimz",
      value: false,
    ),
    AddLocationModel(
      name: "Maho",
      value: false,
    ),
  ];
  List<AddLocationModel> selectedLocation = [];

  returnedLocation() {
    loca.forEach((element) {
      if (element.value) {
        selectedLocation.add(element);
      }
    });
    Navigator.pop(context, selectedLocation);
  }

  final searchLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IconButton(
              onPressed: () {
                returnedLocation();
              },
              icon: Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 25.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    child: TextField(
                      onChanged: (searchService) {
                        searchService = searchService.toLowerCase();
                        print(searchService);

                        loca = location
                            .where(
                              (string) => string.name!.toLowerCase().contains(
                                    searchService.toLowerCase(),
                                  ),
                            )
                            .toList();
                        setState(() {});
                      },
                      style: const TextStyle(fontSize: 12),
                      controller: searchLocation,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search for services",
                        contentPadding:
                            EdgeInsetsDirectional.only(start: 10, end: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(width: 1, color: Theme.of(context).primaryColor)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Theme.of(context).primaryColor,
                              value: loca[index].value,
                              onChanged: (value) {
                                setState(() {
                                  loca[index].value = value!;
                                });
                              },
                            ),
                            Text(
                              "${loca[index].name}",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15.0, end: 15),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
