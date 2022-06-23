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
    return ListTile(
      title: Text(widget.likedByModel.name.toString()),
      leading:  CircleAvatar(
        foregroundImage: AssetImage("assets/images/${widget.likedByModel.image}",),
        radius:20,
        backgroundColor: Colors.transparent,
      ),
      // trailing:           Text("Following",style: TextStyle(color:primaryColor,fontSize: 13,fontWeight: FontWeight.w300),),
    ) ;
  }
}
