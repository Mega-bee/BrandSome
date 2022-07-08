import 'package:brandsome/home_page/response/home_page.dart';
import 'package:flutter/material.dart';


import '../../model/category_model.dart';

class MainCategoryCard extends StatefulWidget {
  final CategoryModel category;
  final Function onCardTAP;


  MainCategoryCard(this.category, this.onCardTAP);

  @override
  State<MainCategoryCard> createState() => _CategoryState();
}

class _CategoryState extends State<MainCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
//        splashColor: Colors.transparent,
        onTap: () {
          widget.onCardTAP();
        },
        child: Column(children: [
          Text(
            widget.category.name!,
          ),
          SizedBox(
            height: 2,
          ),
          Visibility(
            visible: widget.category.selectedCard,
            child: Center(
              child: Container(
                width: 80,
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ]));
  }
}
