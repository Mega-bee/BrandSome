import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

import '../../model/review_model.dart';

class ReviewScreen extends StatelessWidget {
  List<ReviewModel> reviews = [
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it :)",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 29,
                ),                Text(
                  "${reviews[index].name}",
                  style: TextStyle(fontSize: 14, color: whiteColor),
                ),
                SizedBox(height: 9,),
                Text(
                  "${reviews[index].paragraph}",
                  style: TextStyle(fontSize: 9, color: whiteColor),
                ),
                SizedBox(height: 13,),

              ],
            ),
          );
        });
  }
}
