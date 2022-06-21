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
    return  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.08,
                width:MediaQuery.of(context).size.width*0.13,

                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/images/${widget.likedByModel.image}",),
                  radius:120,

                  backgroundColor: Colors.transparent,
                ),
                // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
              )),

          Text(widget.likedByModel.name.toString(),style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(width: 110,),
          Center(child: Text("Following",style: TextStyle(color:primaryColor,fontSize: 13,fontWeight: FontWeight.w300),))


        ]);
  }
}
