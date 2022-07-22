import 'package:flutter/material.dart';


import '../../../categories_module/reponse/category_response.dart';
import '../../model/category_model.dart';

class MainCategoryCard extends StatefulWidget {
  final MainCategoryModel category;
  final Function onCardTAP;


  const MainCategoryCard(this.category, this.onCardTAP);

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
          const SizedBox(
            height: 2,
          ),
          // Visibility(
          //   visible: widget.category,,
          //   child: Center(
          //     child: Container(
          //       width: 80,
          //       height: 2,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          // ),
        ]));
  }
}
