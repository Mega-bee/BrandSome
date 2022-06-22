import 'package:brandsome/business_module/model/business_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_card_details_module/ui/screen/business_card_info_screen.dart';
import '../../../hive/hive.dart';
import '../../../utils/style/colors.dart';
class BusinessCard extends StatelessWidget {
  final BusinessCardModel businessCardModel;

  BusinessCard(this.businessCardModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusinessCardInfoScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 1, child: Image.asset(businessCardModel.img!)),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           businessCardModel.title ?? "",
                            style: StyleText.categoryStylefbusiness,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 13,
                              ),
                              SizedBox(width: 3),
                              Text(
                                businessCardModel.views ?? "",
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
                        businessCardModel.subtitle ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 10,),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            businessCardModel.titleTwo ?? "",
                            style: TextStyle( fontSize: 9),
                          ),
                          SizedBox(
                              width:
                              MediaQuery.of(context).size.width * 0.005),
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                             businessCardModel.km ?? "",
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
                              SvgPicture.asset(SvgImg.PERSON,color:ThemeHelper().getisDark() ? whiteColor : blackColor,),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                    fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(SvgImg.RATE,color:ThemeHelper().getisDark() ? whiteColor : blackColor,),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                    fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(SvgImg.PAPER,color:ThemeHelper().getisDark() ? whiteColor : blackColor,),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                    fontSize: 11),
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
    );
  }
}
