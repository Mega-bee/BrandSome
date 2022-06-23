import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/components/custom_alert_dialog/CustomReviewDialog/CustomVerificationDialog.dart';
import '../../../utils/style/colors.dart';

class BusinessInfo extends StatelessWidget {
  const BusinessInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/testImageCard.png",
            fit: BoxFit.fill,
            width: double.maxFinite,
            height: 250,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Follow"),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.only(right: 20, left: 20),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("1000"),
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
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Text(
              "Healthcare/Sports",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
              child: Row(
                children: [
                  Text(
                    "Personal Trainer ",
                    style: TextStyle(

                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Yoga",
                    style: TextStyle(

                        decoration: TextDecoration.underline),
                  ),
                ],
              )),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
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
                  child: Text(
                    "Zahle",
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        5), // radius of 10// green as background color
                  ),
                  child: Text(
                    "Zahle district",

                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Text(
              "dolor sit amet, consetetur sadipscing",
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
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Center(
              child: Container(

                padding: EdgeInsets.only(top: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5),
                  color: blackColor,
                  border: Border.all(color: primaryColor, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgImg.PERSON),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(fontSize: 12, color: whiteColor),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(SvgImg.RATE),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(fontSize: 12, color: whiteColor),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(SvgImg.PAPER),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(fontSize: 12, color: whiteColor),
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
                      SvgPicture.asset(SvgImg.PHONE,height: 20,color: whiteColor,),

                      SizedBox(
                        width: 5,
                      ),
                      Text("Call Now"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    primary: primaryColor,
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
                      SvgPicture.asset(SvgImg.RATE,height: 20,),

                      SizedBox(
                        width: 5,
                      ),
                      Text("Add review"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 15,right: 15),

                    primary: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25,)
        ],
      ),
    );


  }
}
