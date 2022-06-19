import 'package:brandsome/home_page/model/filtrer_sub_category_model.dart';
import 'package:flutter/material.dart';

import '../../model/choose_category_filter_model.dart';
import '../../model/subCategory.dart';

class FilterSubCategory extends StatefulWidget {
  final FilterSubCategoryModel filtersubcategory;
  final Function onCardTAP;


  FilterSubCategory(this.filtersubcategory, this.onCardTAP,);

  @override
  State<FilterSubCategory> createState() => _FilterSubCategoryState();
}

class _FilterSubCategoryState extends State<FilterSubCategory> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onCardTAP();
      },
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: widget.filtersubcategory.selectedCard ? Image.asset(
              widget.filtersubcategory.img!) : Image.asset(
              widget.filtersubcategory.unselectedimg!)
      ),
    );
  }
}