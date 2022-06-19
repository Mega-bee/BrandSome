import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../business_module/model/business_card.dart';
import '../../../utils/images/images.dart';
import '../../model/business_card_model.dart';
import '../../model/review_model.dart';
import '../widget/business info.dart';
import '../widget/business posts.dart';
import '../widget/reviews.dart';

class BusinessCardInfoScreen extends StatefulWidget {

  @override
  State<BusinessCardInfoScreen> createState() => _BusinessCardInfoScreenState();
}

class _BusinessCardInfoScreenState extends State<BusinessCardInfoScreen> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    late TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title: Text("Business Name"),
        centerTitle: true,
        backgroundColor: blackColor,
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: tabController,
              indicatorColor: primaryColor,
              tabs: [
                Tab(text: "Info",),
                Tab(text: "Posts",),
                Tab(text: "Review",),

              ],
            ),
          ),
          Container(
            child: Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  BusinessInfo(),
                  BusinessPosts(),
                  ReviewScreen(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
