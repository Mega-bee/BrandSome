import 'package:brandsome/business_details_module/request/add_review_request.dart';
import 'package:brandsome/business_details_module/request/is_follow.dart';
import 'package:brandsome/business_details_module/ui/screen/reviews.dart';
import 'package:brandsome/utils/components/custom_alert_dialog/CustomReviewDialog/CustomVerificationDialog.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../reponse/business_response.dart';
import '../screen/business_info.dart';
import '../screen/business posts.dart';
import '../screen/business_details.dart';

class BusinessDetailsSuccess extends States {
  final BusnessDetailsScreenState screenState;
  final BusinessInfoResponse businessInfoModel;

  BusinessDetailsSuccess(
    this.screenState,
    this.businessInfoModel,
  ) : super(false);

  late TabController tabController =
      TabController(length: 3, vsync: screenState);
  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text(
          businessInfoModel.name.toString(),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).cardColor,
            child: TabBar(
              // unselectedLabelColor: Color(0xffDFDFDF),
              // labelColor: primaryColor,
              controller: tabController,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              labelColor: Theme.of(context).primaryColor,
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
                  BusinessInfo(
                    businessInfoModel: businessInfoModel,
                    onNumberClick: (number) {
                      screenState.clickCall(number);
                    },
                    onReviewClick: () {
                      if (screenState.checkIfLogin()) {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                CustomReviewDialog(continueBtn: (reviewText) {
                                  Navigator.pop(context);
                                  screenState.createReview(AddReviewRequest(
                                    Bussinessid:
                                        businessInfoModel.id.toString(),
                                    Description: reviewText,
                                  ));
                                }));
                      } else {
                        screenState.loginFirst();
                      }
                    },
                    onFollow: (rahaf) {
                      screenState.isfollowing(IsFollower(
                        isFollow: rahaf,
                      ));
                    },
                  ),
                  BusinessPosts(
                      businessInfoModel: businessInfoModel.posts ?? []),
                  ReviewScreen(review: businessInfoModel.reviews ?? []),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
