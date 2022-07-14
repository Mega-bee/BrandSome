import 'package:brandsome/business_details_module/ui/widget/review_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import '../../reponse/business_response.dart';

class ReviewScreen extends StatelessWidget {
  final List<Reviews> review;


  ReviewScreen({required this.review,});

  @override
  Widget build(BuildContext context) {
    return
      review.isEmpty ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(ImageAsset.NO_REVIEW,height: 200,),
            Text('No Reviews yet')
          ],) :

      ListView.builder(
        itemCount: review.length,
        itemBuilder: (context, index) {
          return ReviewCard(review[index]);
        });
  }
}
