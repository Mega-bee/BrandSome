import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../reponse/get_likes_list_response.dart';

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
        foregroundImage: NetworkImage("${widget.likedByModel.image}",),
        radius:20,
        backgroundColor: Colors.transparent,
      ),
      // trailing:           Text("Following",style: TextStyle(color:primaryColor,fontSize: 13,fontWeight: FontWeight.w300),),
    ) ;
  }
}
