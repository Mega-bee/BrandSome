import 'package:brandsome/business_details_module/request/add_review_request.dart';
import 'package:brandsome/business_details_module/request/is_follow.dart';
import 'package:brandsome/business_details_module/ui/screen/reviews.dart';
import 'package:brandsome/utils/components/custom_alert_dialog/CustomReviewDialog/CustomVerificationDialog.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../generated/l10n.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../reponse/business_response.dart';
import '../screen/business_info.dart';
import '../screen/business posts.dart';
import '../screen/business_details.dart';

class BusinessDetailsSuccess extends States {
  final BusnessDetailsScreenState screenState;
  final BusinessInfoResponse businessInfoModel;
  final bool islogged;

  BusinessDetailsSuccess(
    this.screenState,
    this.businessInfoModel,
    this.islogged,
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
    return Column(
      children: [
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            // unselectedLabelColor: Color(0xffDFDFDF),
            // labelColor: primaryColor,
            controller: tabController,
            indicatorColor: Theme.of(context).primaryColor,

            tabs: [
              Tab(
                text: S.of(context).Info,
              ),
              Tab(
                text: S.of(context).Posts,
              ),
              Tab(
                text: S.of(context).Review,
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
                    onDeleteClick: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDeleteDialog(
                          title: S.of(context).deleteBusiness,
                          content: S.of(context).doYouReallyWantThisBusiness,
                          yesBtn: () {
                            Navigator.pop(context);
                            screenState.deleteBusiness(
                                businessInfoModel.id.toString());
                          },
                          noBtn: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    isLoggedin: islogged,
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
                      if (screenState.checkIfLogin()) {
                        screenState.isfollowing(IsFollower(
                          isFollow: rahaf,
                        ));
                      } else {
                        screenState.loginFirst();
                      }
                    }),
                BusinessPosts(
                    onDeletePost: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDeleteDialog(
                          title: S.of(context).deletePost,
                          content: "",
                          yesBtn: () {
                            screenState
                                .deletePost(businessInfoModel.id.toString());
                          },
                          noBtn: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    businessInfoModel: businessInfoModel.posts ?? []),
                ReviewScreen(review: businessInfoModel.reviews ?? []),
              ],
            ),
          ),
        )
      ],
    );
  }
}
