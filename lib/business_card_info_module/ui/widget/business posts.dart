import 'package:flutter/material.dart';

import 'business_card.dart';

class BusinessPosts extends StatefulWidget {
  const BusinessPosts({Key? key}) : super(key: key);

  @override
  State<BusinessPosts> createState() => _BusinessPostsState();
}

class _BusinessPostsState extends State<BusinessPosts> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return BusinessCard();
        });
  }
}
