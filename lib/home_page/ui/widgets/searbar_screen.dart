import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final searchbar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 25.0,top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),

                 Expanded(
                   child: TextField(
                     style: const TextStyle(fontSize: 12),
                     controller: searchbar,
                     decoration: InputDecoration(
                           prefixIcon: Icon(Icons.search),
                           filled: true,
                           fillColor: Colors.white,
                           hintText: "Search for services",
                           enabledBorder: const OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(50)),
                               borderSide: BorderSide(width: 2, color: Colors.white)),
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
          ],
        ),
      ),
    );
  }
}
