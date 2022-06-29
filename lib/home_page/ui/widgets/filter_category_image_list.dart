import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';

import '../../../business_module/repository/filter_category_response.dart';
import '../../model/choose_category_filter_model.dart';
import '../../model/filtrer_sub_category_model.dart';
import '../../model/subCategory.dart';

class FilterCategory extends StatefulWidget {
  final FilterSearchModel maincategory;
  final Function onCardTAP;


  FilterCategory(this.maincategory, this.onCardTAP,);

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${widget.maincategory.name}"),
        // SizedBox(height: 20,),
        Image.asset(ImageAssetSports.BOXING,height: 100,),
      ],
    );
    // return InkWell(
    //   onTap: () {
    //     widget.onCardTAP();
    //   },
    //   child: widget.maincategory.selectedCard ? Image.asset(
    //       widget.subcategory.img!) : Image.asset(
    //       widget.subcategory.unselectedimg!),
    // );
  }
}