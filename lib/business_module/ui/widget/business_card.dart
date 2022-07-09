import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_details_module/business_details_route.dart';

class BusinessCard extends StatelessWidget {
  final BusinessResponse businessCardModel;

  BusinessCard(this.businessCardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5,end: 5),
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
                child: SizedBox(
                    height: 120,
                    child: CustomNetworkImage(imageSource: businessCardModel.image ?? '')),
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
                    arguments: {"id":businessCardModel.id.toString(),"name":businessCardModel.name.toString()}
                  );
                },
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
                            style:Theme.of(context).textTheme.titleMedium,
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
                              Expanded(
                                child: Wrap(
                                    children: businessCardModel.city!
                                        .map(
                                          (e) => Text(
                                            "${e.name},",
                                            style:Theme.of(context).textTheme.overline,
                                          ),
                                        )
                                        .toList()),
                              ),
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
                  ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
