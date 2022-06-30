import 'package:flutter/material.dart';

import '../../../business_module/reponse/filter_category_response.dart';
import '../../model/filter_service_model.dart';
import '../../model/subCategory.dart';

class FilterService extends StatefulWidget {
  final List<ServicesCat> service;

  FilterService(this.service,);

  @override
  State<FilterService> createState() => _FilterServiceState();
}

class _FilterServiceState extends State<FilterService> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // widget.service.selectedCard = ! widget.service.selectedCard;
        // setState(() {
        //
        // });
      },

      child: Wrap(
        children: widget.service.map((e) => Text("${e.name}")).toList(),
      ),
      // child: Padding(
      //     padding: const EdgeInsets.all(6.0),
      //     child:  widget.service.selectedCard?Image.asset(widget.service.img!): Image.asset(widget.service.unselectedimg!)
      // ),
    );




  }
}
