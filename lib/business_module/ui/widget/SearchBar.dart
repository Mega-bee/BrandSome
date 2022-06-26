import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final searchbar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 25.0, top: 20.0),
                child: Row(
                  children: [

                    Expanded(
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        controller: searchbar,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 18,
                            ),
                          ),
                          filled: true,
                          hintText: "Search for services",
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              borderSide: BorderSide(
                                width: 2,
                              )),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(),
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
            ],
          ),
        ),
      ),
    );
  }
}
