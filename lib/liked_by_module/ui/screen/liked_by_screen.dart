import 'package:brandsome/liked_by_module/model/liked_by_model.dart';
import 'package:brandsome/liked_by_module/ui/widget/likes_card.dart';
import 'package:flutter/material.dart';

import '../../../follower_module/ui/widget/followers_card.dart';
import '../../../utils/components/Seperator/seperator_doted.dart';
import '../../../utils/style/colors.dart';


class LikeByScreen extends StatefulWidget {
  const LikeByScreen({Key? key}) : super(key: key);

  @override
  State<LikeByScreen> createState() => _LikeByScreenState();
}

class _LikeByScreenState extends State<LikeByScreen> {
  List<LikedByModel> likes = [
    LikedByModel(
      name: "Peter Tohme    ",
     image: "Peter.png",
    ),
    LikedByModel(
        name: "Walid Taktak   ",
        image:"IMG_0095.JPG",
    ),
    LikedByModel(
        name: "Charbel copy   ",
        image: "Peter.png",
    ),
    LikedByModel(
        name: "Christian       ",
        image:"IMG_0095.JPG",
    ),
    LikedByModel(
        name: "Kamal Frenn    ",
        image:"Peter.png",
    ),
    LikedByModel(
        name: "jack Tohme      ",
        image: "IMG_0095.JPG",
    ),
    LikedByModel(
      name: "Hadi past   ",
      image:"Peter.png",
    ),
    LikedByModel(
      name: "Wael Kfoury    ",
      image:"IMG_0095.JPG",
    ),
    LikedByModel(
      name: "Nancy Ajram    ",
      image: "Peter.png",
    ),
    LikedByModel(
      name: "Peter Tohme    ",
      image: "Peter.png",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        
          backgroundColor: blackColor,
          appBar: AppBar(
            elevation: 1,
            shadowColor: Colors.white,
            title: Text("Likes"),
            backgroundColor: blackColor,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: SingleChildScrollView(

              child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[ Text("Liked by :",style: TextStyle(color: darkWhiteColor,fontSize: 16,fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                        ),),
                          SizedBox(width: 30,),
                          Text("${likes.length} people",style: TextStyle(color: primaryColor))

                        ]),
                      ),
                      SizedBox(height: 15,),
                      MySeparator(color: Colors.grey,height: 0.9,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: likes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LikesCard(likes[index]),
                            );
                          })]),
              ),
            ),
          )

      ),
    );  }
}
