import 'package:brandsome/business_details_module/reponse/business_response.dart';
import 'package:brandsome/utils/helpers/date_converter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewCard extends StatelessWidget {
  final Reviews review;

  const ReviewCard(this.review);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(review.name ?? ''),
            subtitle: Text(review.description ?? ''),
            trailing: Text(timeago.format(DateHelper.convertDateToLocal(review.createdDate ?? DateTime(0))),
            ),
          ),
          const Divider(thickness: 2,)
        ],
      ),
    );
  }
}
