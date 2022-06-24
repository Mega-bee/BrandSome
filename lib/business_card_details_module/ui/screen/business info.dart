import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/components/custom_alert_dialog/CustomReviewDialog/CustomVerificationDialog.dart';
import '../../../utils/style/colors.dart';
import '../../model/business_info_model.dart';

class BusinessInfo extends StatelessWidget {
  final  businessInfoModel;
  BusinessInfo({required this.businessInfoModel});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Image.network(
            businessInfoModel.image.toString(),
            fit: BoxFit.fill,
            width: double.infinity,
            height: 220,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(

                  onPressed: () {},
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    ),
                  ),
                  style: ElevatedButton.styleFrom(

                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsetsDirectional.only(
                      end: 30,
                      top: 1,
                      bottom: 1,
                      start: 30,
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${businessInfoModel.viewCount}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Text(
              "${businessInfoModel.type}",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
              child: Row(
                children:businessInfoModel.services!.map<Widget>((e) =>  Text(
                  "${e.name}",
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 10,color: Colors.white),
                ),).toList(),



              )),
          SizedBox(
            height: 15,
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
                SizedBox(
                  width: 9,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                  decoration: BoxDecoration(
                    color: Color(0xff262626),
                    borderRadius: BorderRadius.circular(
                        5), // radius of 10// green as background color
                  ),
                  child: Row(
                      children: businessInfoModel.cities!.map<Widget>((e) => Text(
                        "${e.name} ",
                        style: TextStyle(color: darkerWhiteColor, fontSize: 12),
                      ),).toList()
                  )
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
            height: 22,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Text(
              "${businessInfoModel.description}",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffDFDFDF),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0, end: 23.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: blackColor,
                  border: Border.all(color: primaryColor, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImg.PERSON,
                          color: Colors.white,
                          height: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${businessInfoModel.followCount}"),
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
                          height: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${businessInfoModel.reviewCount}"),
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
                          height: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${businessInfoModel.postCount}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgImg.PHONE,
                        height: 20,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Call Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomReviewDialog(
                        content: "",
                        continueBtn: () {},
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgImg.RATING,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Add review", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    primary: primaryColor,
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
