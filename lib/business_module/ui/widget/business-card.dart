import 'package:brandsome/business_module/model/business_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_card_info_module/ui/screen/business_card_info_screen.dart';
import '../../../utils/style/colors.dart';

class BusinessCardScreen extends StatefulWidget {
  final BusinessCardModel businessCardModel;

  // final String? text;

  BusinessCardScreen(
    this.businessCardModel,
  );

  @override
  State<BusinessCardScreen> createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  String? firstHalf;

  String? secondHalf;

  bool? flag = true;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   if (widget.text!.length > 40) {
  //     firstHalf = widget.text!.substring(0, 40);
  //     secondHalf = widget.text!.substring(
  //       40,
  //       widget.text!.length,
  //     );
  //   } else {
  //     firstHalf = widget.text;
  //     secondHalf = "";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusinessCardInfoScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
        child: Container(
          child: Card(
            color: Color(0xff1E1513),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1, child: Image.asset(widget.businessCardModel.img!)),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.businessCardModel.title ?? "",
                              style: StyleText.categoryStylefbusiness,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: whiteColor,
                                  size: 13,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  widget.businessCardModel.views ?? "",
                                  style: StyleText.categoryStyleviews,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),

                        Text(
                          widget.businessCardModel.subtitle ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 10,color: whiteColor),
                          softWrap: true,
                        ),


                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.businessCardModel.titleTwo ?? "",
                              style: TextStyle(color: hintText, fontSize: 9),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.005),
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white60,
                              size: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                widget.businessCardModel.km ?? "",
                                style: StyleText.KM,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(SvgImg.PERSON),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "1000",
                                  style:
                                      TextStyle(color: whiteColor, fontSize: 11),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(SvgImg.RATE),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "1000",
                                  style:
                                      TextStyle(color: whiteColor, fontSize: 11),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(SvgImg.PAPER),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "1000",
                                  style:
                                      TextStyle(color: whiteColor, fontSize: 11),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
