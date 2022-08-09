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
          widget.category.isSelected!
              ? Container(
            padding: EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              border:Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,

                )
              )
            ),
                child: Text(
                    widget.category.name!,

                  ),
              )
              : Text(
                  widget.category.name!,
                  style: TextStyle(color: Colors.grey),
                ),
          const SizedBox(
            height: 2,
          ),
          // Visibility(
          //   visible: widget.category.isSelected!,
          //   child: Center(
          //     child: Container(
          //       width: 70,
          //       height: 2,
          //       color: Theme.of(context).primaryColor,
          //
          //     ),
          //   ),
          // ),
        ]));
  }
}
