import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/review_model.dart';

class ReviewScreen extends StatelessWidget {
  List<ReviewModel> reviews = [
    ReviewModel(
        name: "Peter Tohme",
        paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you",
        date: DateTime.now()),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you",
    ),
    ReviewModel(
      name: "Peter Tohme",
      paragraph: "This app is very good i like it , hello how are you , welcome to brandsome love you This app is very good i like it , hello how are you , welcome to brandsome love you",
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${reviews[index].name}",style: TextStyle(fontSize: 14,),
                    ),
                    Text(
                      "${DateTime.now().toString().split('1').first

                      }",style: TextStyle(fontSize: 8,color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${reviews[index].paragraph}",style: TextStyle(fontSize: 9,color: Colors.grey[300]),
                ),
                SizedBox(
                  height: 13,
                ),
              ],
            ),
          );
        });
  }
}
