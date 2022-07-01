import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final int catId;
  final String catName;
  bool isSlecteced;
  final Function onCardTap;

  CategoryCard(
      {required this.catId,
      required this.catName,
      required this.isSlecteced,
      required this.onCardTap});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isSlecteced = !widget.isSlecteced;
        widget.onCardTap();
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: widget.isSlecteced
              ? Theme.of(context).disabledColor
              : Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(widget.catName),
                SizedBox(height: 8,),
                Image.asset(
                  ImageAsset.CAT,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
