import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/style/text_style.dart';
import '../../model/category_model.dart';

class Category extends StatefulWidget {
  final CategoryModel category;
  final Function onCardTAP;


  Category(this.category,this.onCardTAP);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){

        widget.onCardTAP();
      },
      child: widget.category.selectedCard?Column(
        children:[ Text(
          widget.category.name!,
          style: TextStyle(

            fontSize: 12



          ),
        ),
      SizedBox(height: 4,),
      Center(
        child: Container(
          width: 80,
          height: 2,
          color: primaryColor,
        ),
      ),])
      :Text(
        widget.category.name!,
        style: TextStyle(
          fontSize: 12,

        ),
      )
    );
  }
}
