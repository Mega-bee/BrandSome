import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../utils/helpers/date_converter.dart';
import '../../model/business_info_model.dart';

class ReviewScreen extends StatelessWidget {
  final List<Reviews> review;


  ReviewScreen({required this.review,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: review.length,
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
                      "${review[index].name}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeago.format(DateHelper.convertDateToLocal(review[index].createdDate ?? DateTime(0))),
                      style: TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                    // Text(
                    //   "${DateTime.now().toString().split('1').first}",
                    //   style: TextStyle(fontSize: 8, color: Colors.grey),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${review[index].description}",
                  style: TextStyle(fontSize: 9, color: Colors.grey[300]),
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
