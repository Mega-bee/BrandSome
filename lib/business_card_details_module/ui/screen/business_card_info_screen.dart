import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import '../../../hive/hive.dart';
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
       appBar: AppBar(
         centerTitle: true,
         elevation: 0,
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
         title: Padding(
           padding: const EdgeInsetsDirectional.only(start: 10.0),
           child: Text(
             "Bussines name",
           ),
         ),
      ),
      body: Column(
        children: [

          Container(
            color: Theme.of(context).cardColor,
            child: TabBar(
              unselectedLabelColor: Color(0xffDFDFDF),
              labelColor: primaryColor,
              controller: tabController,
              indicatorColor: Theme.of(context).primaryColor,
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
