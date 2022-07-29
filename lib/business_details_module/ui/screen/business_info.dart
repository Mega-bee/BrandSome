import 'package:brandsome/business_details_module/business_details_route.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import '../../../generated/l10n.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/components/cutom_network_image.dart';
import '../../reponse/business_detailes_response.dart';

class BusinessInfo extends StatefulWidget {
  final BusinessInfoResponse businessInfoModel;
  final Function onDeleteClick;
  final Function onNumberClick;
  final Function onReviewClick;
  final Function onFollow;
  final bool isLoggedin;

  BusinessInfo({
    required this.businessInfoModel,
    required this.onNumberClick,
    required this.onReviewClick,
    required this.onFollow,
    required this.isLoggedin,
    required this.onDeleteClick,
  });

  @override
  State<BusinessInfo> createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          SizedBox(
              height: 260,
              child: CustomNetworkImage(
                imageSource: widget.businessInfoModel.image.toString(),
              )
              // PinchZoom(
              //   resetDuration: const Duration(milliseconds: 150),
              //   onZoomStart: () {},
              //   onZoomEnd: () {},
              //   zoomEnabled: true,
              //
              //   child: Image.network(
              //     widget.businessInfoModel.image.toString(),
              //     fit: BoxFit.fitWidth,
              //     width: double.infinity,
              //     height: 270,
              //   ),
              // ),
              ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (widget.isLoggedin) {
                      widget.businessInfoModel.isFollow =
                          !widget.businessInfoModel.isFollow!;
                      setState(() {});
                    }

                    widget.onFollow(widget.businessInfoModel.isFollow);
                  },
                  child: widget.businessInfoModel.isFollow!
                      ? Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            S.of(context).Unfollow,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            "  ${S.of(context).Follow}  ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                  style: widget.businessInfoModel.isFollow!
                      ? ElevatedButton.styleFrom(
                          padding: EdgeInsetsDirectional.only(
                            end: 20,
                            start: 20,
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(4)),
                        )
                      : ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsetsDirectional.only(
                            end: 20,
                            start: 20,
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.businessInfoModel.viewCount}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Text(
              "${widget.businessInfoModel.type}",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
              child: Wrap(
                children: widget.businessInfoModel.services!
                    .map<Widget>(
                      (e) => Padding(
                        padding:
                            const EdgeInsetsDirectional.only(end: 8, top: 10),
                        child: Text(
                          "${e.name}",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 17.0, end: 23.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),

                Expanded(
                  child: Container(



                      padding: EdgeInsets.fromLTRB(1, 3, 15, 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5), // radius of 10// green as background color
                      ),
                      child: Wrap(
//                        mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.businessInfoModel.cities!
                              .map<Widget>(
                                (e) => SizedBox(
                                  height: 30,
                                  width: 60,
                                  child: Card(
color: Colors.grey[800],
                                    child: Center(
                                      child: Text(
                                        "${e.name} ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList())),
                ),

                SizedBox(
                  width: 11,
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                //   decoration: BoxDecoration(
                //     color: Color(0xff262626),
                //     borderRadius: BorderRadius.circular(
                //         5), // radius of 10// green as background color
                //   ),
                //   child: Text(
                //     "Zahle district",
                //     style: TextStyle(color: darkerWhiteColor, fontSize: 12),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Text(
              "${widget.businessInfoModel.description}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImg.PERSON,
                          color: Colors.white,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${widget.businessInfoModel.followCount}"),
                      ],
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImg.RATE,
                          color: Colors.white,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${widget.businessInfoModel.reviewCount}"),
                      ],
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImg.PAPER,
                          color: Colors.white,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${widget.businessInfoModel.postCount}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    widget.businessInfoModel.isUserBusiness!
                        ? Navigator.pushNamed(context,
                            BusinessDetailsRoutes.BUSINESS_UPDATE_SCREEN,
                            arguments: widget.businessInfoModel)
                        : widget.onNumberClick(
                            widget.businessInfoModel.phoneNumber);
                  },
                  child: Row(
                    children: [
                      widget.businessInfoModel.isUserBusiness!
                          ? Icon(
                              Icons.edit,
                              color: Colors.white,
                            )
                          : SvgPicture.asset(
                              SvgImg.PHONE,
                              height: 20,
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.businessInfoModel.isUserBusiness!
                            ? S.of(context).Update
                           : S.of(context).CallNow,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.businessInfoModel.isUserBusiness!
                        ? widget.onDeleteClick()
                         :widget.onReviewClick();
                    // );
                  },
                  child: Row(
                    children: [
                      widget.businessInfoModel.isUserBusiness!
                          ? Icon(
                              Icons.delete,
                              color: Colors.white,
                            )
                          :
                  SvgPicture.asset(
                              SvgImg.RATING,
                              height: 20,
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          // widget.businessInfoModel.isUserBusiness!
                          //     ? S.of(context).Delete
                               S.of(context).addReview,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
