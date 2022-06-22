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
  final BusinessResponse businessCardModel;

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
                flex: 1,
                child: Image.network(
                  businessCardModel.image.toString(),
                ),
              ),
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
                            businessCardModel.name ?? "",
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
                                businessCardModel.viewCount.toString(),
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
                        businessCardModel.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: businessCardModel.city!
                                  .map(
                                    (e) => Text(
                                      "${e.name}",
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  )
                                  .toList()),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005),
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "5km",
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
                              SvgPicture.asset(
                                SvgImg.PERSON,
                                color: ThemeHelper().getisDark()
                                    ? whiteColor
                                    : blackColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "${businessCardModel.followCount}",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                SvgImg.RATE,
                                color: ThemeHelper().getisDark()
                                    ? whiteColor
                                    : blackColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "${businessCardModel.reviewCount}",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                SvgImg.PAPER,
                                color: ThemeHelper().getisDark()
                                    ? whiteColor
                                    : blackColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "${businessCardModel.postCount}",
                                style: TextStyle(fontSize: 11),
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
