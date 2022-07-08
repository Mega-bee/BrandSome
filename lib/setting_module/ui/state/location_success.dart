import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/utils/components/costom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../response/add_location_response.dart';
import '../screen/add_location.dart';

class LocationSuccess extends States{
    List<AddLocationResponse> loca;

  final  AddLocationScreenState addLocationScreenState;

  LocationSuccess(this.loca,this.addLocationScreenState) : super(false);

  final searchLocation = TextEditingController();
  @override
  Widget getUI(BuildContext context) {
   return SingleChildScrollView(
     child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: CustomSearch(hintText: 'Search for location', onChanged: (searchText) {
             searchText = searchText.toLowerCase();
             print(searchText);
             print("search test");

             addLocationScreenState.loca1 = loca
                 .where(
                   (string) =>
                   string.name!.toLowerCase().contains(
                     searchText.toLowerCase(),
                   ),
             )
                 .toList();
             addLocationScreenState.refrech();
           },),
         ),

         ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: addLocationScreenState.loca1.length,
             itemBuilder: (context, index) {
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 15.0),
                     child: Row(
                       children: [
                         Checkbox(
                           activeColor: Theme.of(context).primaryColor,
                           value: addLocationScreenState.loca1[index].value,
                           onChanged: (value) {
                             addLocationScreenState.loca1[index].value = value!;
                               addLocationScreenState.refrech();
                               if(value){
                                 print("Cities selected");
                                 addLocationScreenState.selectedLocation.add(addLocationScreenState.loca1[index]);

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
                       thickness: 3,
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