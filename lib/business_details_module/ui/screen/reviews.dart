import 'package:brandsome/business_details_module/ui/widget/review_card.dart';
import 'package:flutter/material.dart';
import '../../reponse/business_response.dart';

class ReviewScreen extends StatelessWidget {
  final List<Reviews> review;


  ReviewScreen({required this.review,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: review.length,
        itemBuilder: (context, index) {
          return ReviewCard(review[index]);
        });
  }
}
