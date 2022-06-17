import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';
import '../../../utils/style/text_style.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/testImageCard.png"),
          ),
          title: Text(
            "Title}",
            style: TextStyle(color: whiteColor),
          ),
          subtitle: Text(
            "subTitle",
            style: TextStyle(color: whiteColor),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Color(0xff171717),
          color: blackColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/testImageCard.png",
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
                      "Title Two",
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
                          text: 'Properties/ ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Appartments/ ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Electricians/ ',
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
                  "Paragraph",
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
