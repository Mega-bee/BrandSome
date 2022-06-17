import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/style/colors.dart';
import '../../../utils/style/text_style.dart';

class BusinessInfo extends StatelessWidget {
  const BusinessInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            // height: 250,
            child: Image.asset(
              "assets/images/testImageCard.png",
              fit: BoxFit.cover,
            ),
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
                    primary: primaryColor,
                    padding: EdgeInsets.only(right: 20, left: 20),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: whiteColor,
                      size: 13,
                    ),
                    SizedBox(width: 3),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1000",
                        style: StyleText.categoryStyleviews,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Text(
              "Healthcare/Sports",
              style: StyleText.categoryStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
              child: Row(
                children: [
                  Text(
                    "Personal Trainer ",
                    style: TextStyle(
                        color: darkWhiteColor,
                        decoration: TextDecoration.underline),
                  ),
                  Text(
                    "Yoga",
                    style: TextStyle(
                        color: darkWhiteColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: primaryColor,
                ),
                Container(
                  color: Color(0xff262626),
                  child: Text(
                    "Zahle",
                    style: TextStyle(
                        color: Color(
                          0xff818181,
                        ),
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  color: Color(0xff262626),
                  child: Text(
                    "Zahle district",
                    style: TextStyle(
                        color: Color(
                          0xff818181,
                        ),
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36.0, end: 36.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
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
                      style: TextStyle(fontSize: 14, color: whiteColor),
                    ),
                    SizedBox(width: 30,),

                    Text(
                      "|",
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(width: 30,),

                    SvgPicture.asset(SvgImg.RATE),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(fontSize: 14, color: whiteColor),
                    ),
                    SizedBox(width: 30,),

                    Text(
                      "|",
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(width: 30,),

                    SvgPicture.asset(SvgImg.PAPER),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(fontSize: 14, color: whiteColor),
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.phone,color: whiteColor,),
                                SizedBox(width: 5,),
                                Text("Call Now"),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.phone,color: whiteColor,),
                                SizedBox(width: 5,),
                                Text("Add review"),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
        ],
      ),
    );

    //           // Row(
    //           //   children: [
    //           //     ElevatedButton(
    //           //       onPressed: () {},
    //           //       child: Row(
    //           //         children: [
    //           //           Icon(Icons.phone,color: whiteColor,),
    //           //           SizedBox(width: 5,),
    //           //           Text("Call Now"),
    //           //         ],
    //           //       ),
    //           //       style: ElevatedButton.styleFrom(
    //           //         primary: primaryColor,
    //           //       ),
    //           //     ),
    //           //     ElevatedButton(
    //           //       onPressed: () {},
    //           //       child: Row(
    //           //         children: [
    //           //           Icon(Icons.phone,color: whiteColor,),
    //           //           SizedBox(width: 5,),
    //           //           Text("Add review"),
    //           //         ],
    //           //       ),
    //           //       style: ElevatedButton.styleFrom(
    //           //         primary: primaryColor,
    //           //       ),
    //           //     ),
    //           //   ],
    //           // )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
