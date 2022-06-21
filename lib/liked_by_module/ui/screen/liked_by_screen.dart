import 'package:brandsome/liked_by_module/model/liked_by_model.dart';
import 'package:brandsome/liked_by_module/ui/widget/likes_card.dart';
import 'package:flutter/material.dart';

import '../../../follower_module/ui/widget/followers_card.dart';
import '../../../utils/style/colors.dart';


class LikeByScreen extends StatefulWidget {
  const LikeByScreen({Key? key}) : super(key: key);

  @override
  State<LikeByScreen> createState() => _LikeByScreenState();
}

class _LikeByScreenState extends State<LikeByScreen> {
  List<LikedByModel> likes = [
    LikedByModel(
      name: "Peter Tohme"
    ),
    LikedByModel(
        name: "Walid Taktak"
    ),
    LikedByModel(
        name: "Charbel Mahfouz"
    ),
    LikedByModel(
        name: "Christian Zakhour"
    ),
    LikedByModel(
        name: "Kamal Frenn"
    ),
    LikedByModel(
        name: "Paul Tohme"
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          title: Text("Likes"),
          backgroundColor: blackColor,
        ),
        body: SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text("Liked by 28 people",style: TextStyle(color: darkWhiteColor),),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 38.0,left: 38.0),
                  child: Divider(
                    thickness:
                    1,
                    color: borderColor,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return LikesCard(likes[index]);
                    })]),
        )

    );  }
}
