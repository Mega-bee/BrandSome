import 'package:brandsome/liked_by_module/model/liked_by_model.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikesCard extends StatefulWidget {
  final LikedByModel likedByModel;

  LikesCard(this.likedByModel);

  @override
  State<LikesCard> createState() => _LikesCardState();
}

class _LikesCardState extends State<LikesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
        child: Text(
          "${widget.likedByModel.name}",
          style: TextStyle(color: whiteColor, fontSize: 12),
        ));
  }
}
