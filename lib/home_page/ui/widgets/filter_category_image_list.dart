import 'package:flutter/material.dart';

import '../../model/choose_category_filter_model.dart';
import '../../model/filtrer_sub_category_model.dart';
import '../../model/subCategory.dart';

class FilterCategory extends StatefulWidget {
  final CategoryFilterModel subcategory;
  final Function onCardTAP;


  FilterCategory(this.subcategory, this.onCardTAP,);

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onCardTAP();
      },
      child: widget.subcategory.selectedCard ? Image.asset(
          widget.subcategory.img!) : Image.asset(
          widget.subcategory.unselectedimg!),
    );
  }
}