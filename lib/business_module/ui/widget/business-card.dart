import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        color: Color(0xff1E1513),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: Image.asset(
              "assets/images/testImageCard.png",

            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Title Here",
                  style: TextStyle(color: whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140.0),
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: whiteColor,
                    size: 15,
                  ),
                ),
                Text(
                  "1000",
                  style: TextStyle(color: whiteColor),
                ),
                SizedBox(
                  height: 35,
                )
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subtitle here",
                  style: TextStyle(color: whiteColor),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "Country,City,Address",
                      style: TextStyle(color: whiteColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: whiteColor,
                      size: 12,
                    ),
                    Text(
                      "5km",
                      style: TextStyle(color: whiteColor, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person_outline_outlined,
                      color: whiteColor,
                    ),
                    Text(
                      '500',
                      style: TextStyle(color: whiteColor),
                    ),
                    Icon(
                      Icons.person_outline_outlined,
                      color: whiteColor,
                    ),
                    Text(
                      '10',
                      style: TextStyle(color: whiteColor),
                    ),
                    Icon(
                      Icons.person_outline_outlined,
                      color: whiteColor,
                    ),
                    Text(
                      '10',
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
