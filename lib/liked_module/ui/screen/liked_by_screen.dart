import 'package:brandsome/liked_module/model/liked_by_model.dart';
import 'package:brandsome/liked_module/ui/widget/likes_card.dart';
import 'package:flutter/material.dart';
import '../../../utils/components/Seperator/seperator_doted.dart';


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
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(
              "Likes",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        body: SingleChildScrollView(
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

                    Text("${likes.length} people",style: TextStyle(color: Theme.of(context).primaryColor))
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MySeparator(height: 3,color: Theme.of(context).primaryColorLight,),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: likes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LikesCard(likes[index]),
                      );
                    })]),
        )

    );  }
}
