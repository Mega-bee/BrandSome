import 'package:brandsome/business_details_module/ui/screen/business_card_info_screen.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessCard extends StatelessWidget {
  final BusinessResponse businessCardModel;

  BusinessCard(this.businessCardModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BusinessCardInfoScreen(
                    title: businessCardModel.name,
                    id: businessCardModel.id,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(businessCardModel.image ?? '',fit: BoxFit.fill,),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                businessCardModel.name ?? "",
                                style:Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(businessCardModel.viewCount.toString()),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            businessCardModel.description ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
//                            softWrap: true,
                           style:Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                              ),
                              Wrap(
                                  children: businessCardModel.city!
                                      .map(
                                        (e) => Text(
                                          "${e.name},",
                                          style:Theme.of(context).textTheme.overline,
                                        ),
                                      )
                                      .toList()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 8.0, end: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      SvgImg.PERSON,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${businessCardModel.followCount}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      SvgImg.RATE,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${businessCardModel.reviewCount}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      SvgImg.PAPER,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${businessCardModel.postCount}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
