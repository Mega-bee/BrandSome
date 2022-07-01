import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/utils/components/costom_search.dart';
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
           padding: const EdgeInsets.all(10.0),
           child: CustomSearch(hintText: 'Search for location'),
         ),

         ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: loca.length,
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