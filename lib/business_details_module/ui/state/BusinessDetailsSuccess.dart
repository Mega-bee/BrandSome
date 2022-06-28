import 'package:brandsome/business_details_module/ui/screen/reviews.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../reponse/business_response.dart';
import '../screen/business info.dart';
import '../screen/business posts.dart';
import '../screen/business_details.dart';

class BusinessDetailsSuccess extends States{
  final BusnessDetailsScreenState screenState;
  final BusinessInfoResponse businessInfoModel;
  BusinessDetailsSuccess(this.screenState,this.businessInfoModel);
  late TabController tabController = TabController(length: 3, vsync: screenState);

  @override
  Widget getUI(BuildContext context) {
    return  Column(
      children: [
        Container(
          color: Theme
              .of(context)
              .cardColor,
          child: TabBar(
            // unselectedLabelColor: Color(0xffDFDFDF),
            // labelColor: primaryColor,
            controller: tabController,
            indicatorColor: Theme
                .of(context)
                .primaryColor,
            tabs: [
              Tab(
                text: "Info",
              ),
              Tab(
                text: "Posts",
              ),
              Tab(
                text: "Review",
              ),
            ],
          ),
        ),
        Container(
          child: Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                BusinessInfo(businessInfoModel: businessInfoModel, onNumberClick: (number){
                  screenState.ClickCall(number);
                },),
                BusinessPosts(businessInfoModel: businessInfoModel.posts??[]),
                ReviewScreen(review: businessInfoModel.reviews??[]),
              ],
            ),
          ),
        )
      ],
    );
  }
}


