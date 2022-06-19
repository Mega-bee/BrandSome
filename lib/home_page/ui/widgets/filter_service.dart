import 'package:flutter/material.dart';

import '../../model/filter_service_model.dart';
import '../../model/subCategory.dart';

class FilterService extends StatefulWidget {
  final FilterServiceModel service;

  FilterService(this.service,);

  @override
  State<FilterService> createState() => _FilterServiceState();
}

class _FilterServiceState extends State<FilterService> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.service.selectedCard = ! widget.service.selectedCard;
        setState(() {

        });
      },
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child:  widget.service.selectedCard?Image.asset(widget.service.img!): Image.asset(widget.service.unselectedimg!)
      ),
    );




  }
}
