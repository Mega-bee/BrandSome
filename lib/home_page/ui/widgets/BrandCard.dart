import 'package:brandsome/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  // final NewsOne newsone;

  // NewsCard(this.newsone);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/testImageCard.png"),
          ),
          title: Text(
            "title",
            style: TextStyle(color: whiteColor),
          ),
          subtitle: Text(
            "subtitle",
            style: TextStyle(color: whiteColor),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: whiteColor,
          color: blackColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 155.0),
                    child: Text(
                      "Liked by 28 visitors",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                  Text(
                    "2 days ago",
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Properties / Appartments / Electricians",
                  style: TextStyle(color: Colors.white38),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
                  style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ],
    );
  }
}
