import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 16, color: whiteColor),
                ),
                SizedBox(height: 9,),
                Text(
                  "um is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                  style: TextStyle(fontSize: 10, color: whiteColor),
                ),
                SizedBox(height: 13,),

              ],
            ),
          );
        });
  }
}
