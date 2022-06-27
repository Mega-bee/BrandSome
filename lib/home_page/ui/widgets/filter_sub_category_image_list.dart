import 'package:brandsome/home_page/model/filtrer_sub_category_model.dart';
import 'package:flutter/material.dart';

import '../../../business_module/reponse/filter_category_response.dart';
import '../../../utils/images/images.dart';


class FilterSubCategory extends StatefulWidget {
  final SubCategories filtersubcategory;
  final Function onCardTAP;


  FilterSubCategory(this.filtersubcategory, this.onCardTAP,);

  @override
  State<FilterSubCategory> createState() => _FilterSubCategoryState();
}

class _FilterSubCategoryState extends State<FilterSubCategory> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("${widget.filtersubcategory.name}"),
          SizedBox(height: 20,),
          Image.asset(ImageAssetSports.BOXING,),
        ],
      ),
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