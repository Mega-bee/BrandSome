import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/review_model.dart';

class ReviewScreen extends StatelessWidget {
  List<ReviewModel> reviews = [
    ReviewModel(
        name: "Peter Tohme",
        paragraph: "This app is very good i like it :)",
        date: DateTime.now()),
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
  DateTime now = new DateTime.now();

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
                      "${reviews[index].name}",style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "${DateFormat.yMd().add_jm().format(
                        DateTime.parse(
                          now.toString(),
                        ),
                      )}",style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${reviews[index].paragraph}",style: TextStyle(fontSize: 11),
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
