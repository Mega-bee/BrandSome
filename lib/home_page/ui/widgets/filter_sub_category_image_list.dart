import 'package:brandsome/home_page/model/filtrer_sub_category_model.dart';
import 'package:flutter/material.dart';

import '../../../business_module/reponse/filter_category_response.dart';
import '../../../utils/images/images.dart';


class FilterSubCategory extends StatefulWidget {
  final List<SubCategories> filtersubcategory;
  final Function onCardTAP;


  FilterSubCategory(this.filtersubcategory, this.onCardTAP,);

  @override
  State<FilterSubCategory> createState() => _FilterSubCategoryState();
}

class _FilterSubCategoryState extends State<FilterSubCategory> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 25,
      children:  widget.filtersubcategory.map((e) {
        print("name:${e.name}");
        return Text("${e.name}",);
      }).toList(),

    );

    // return InkWell(
    //   onTap: () {
    //     widget.onCardTAP();
    //   },
    //   child: widget.filtersubcategory.selectedCard ? Image.asset(
    //       widget.filtersubcategory.img!) : Image.asset(
    //       widget.filtersubcategory.unselectedimg!),
    // );
  }
}