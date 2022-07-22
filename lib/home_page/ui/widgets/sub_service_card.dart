import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';

import '../../../home_page/model/subCategory.dart';

class SubServieCard extends StatefulWidget {
  final int subId;
  final String subName;
  final String serviceName;
  final String serviceImage;
  bool isSlecteced;
  final Function onCardTap;

  SubServieCard(
      {required this.subId,
        required this.subName,
        required this.isSlecteced,
        required this.onCardTap,
        required this.serviceName,
        required this.serviceImage,
      });

  @override
  _SubServieCardState createState() => _SubServieCardState();
}

class _SubServieCardState extends State<SubServieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isSlecteced = !widget.isSlecteced;
        widget.onCardTap(widget.isSlecteced);
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
                Text(widget.subName),
                const SizedBox(height: 1,),
                Image.network(
                  widget.serviceImage.toString(),height: 50,
                ),
                Text(widget.serviceName)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
