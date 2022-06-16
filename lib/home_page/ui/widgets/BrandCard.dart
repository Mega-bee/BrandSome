import 'package:brandsome/utils/style/colors.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/post_model.dart';

class BrandCards extends StatelessWidget {
final postModel posts;
BrandCards(this.posts);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("${posts.imgOne}"),
          ),
          title: Text(
            "${posts.title}",
            style: TextStyle(color: whiteColor),
          ),
          subtitle: Text(
            "${posts.subTitle}",
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
                "${posts.imgTwo}",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${posts.titleTwo}",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Properties ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Appartments ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Electricians',
                          style: StyleText.categoryStyleUnderline)
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "${posts.paragraph}",
                  style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
