import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/liked_module/reponse/get_likes_list_response.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/Seperator/seperator_doted.dart';
import '../widget/likes_card.dart';

class LikedListSuccess extends States {
  final List <LikedByModel> likedmodel;
LikedListSuccess(this.likedmodel);
  @override
  Widget getUI(BuildContext context) {
   return  SingleChildScrollView(
     physics: BouncingScrollPhysics(
         parent: AlwaysScrollableScrollPhysics()),
     child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsetsDirectional.all(20),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:[ Text("Liked by :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic
                 ),),

                   Text("likes.length people",style: TextStyle(color: Theme.of(context).primaryColor))
                 ]),
           ),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: MySeparator(height: 3,color: Theme.of(context).primaryColorLight,),
           ),
           ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemCount: likedmodel.length,
               itemBuilder: (context, index) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: LikesCard(likedmodel[index]),
                 );
               })]),
   );
  }


}
