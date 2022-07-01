import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../response/add_location_response.dart';
import '../screen/add_location.dart';

class LocationSuccess extends States{
  final List<AddLocationResponse> loca;
  final  AddLocationScreenState addLocationScreenState;

  LocationSuccess(this.loca,this.addLocationScreenState) : super(false);
  final searchLocation = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
   return SingleChildScrollView(
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
                   // onChanged: (searchService) {
                   //   searchService = searchService.toLowerCase();
                   //   print(searchService);
                   //
                   //   loca = location
                   //       .where(
                   //         (string) => string.name!.toLowerCase().contains(
                   //       searchService.toLowerCase(),
                   //     ),
                   //   )
                   //       .toList();
                   //   setState(() {});
                   // },
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
                               loca[index].value = value!;
                               addLocationScreenState.refrech();
                               if(value){
                                 print("Cities selected");
                                 addLocationScreenState.selectedLocation.add(loca[index]);

                               }
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
   );
  }
  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}