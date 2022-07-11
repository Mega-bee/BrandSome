import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
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
              child: SizedBox(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: businessCardModel.image ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 1),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
                      arguments: {
                        "id": businessCardModel.id.toString(),
                        "name": businessCardModel.name.toString()
                      });
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
                            style: TextStyle(fontSize: 17),
                            // style:Theme.of(context).textTheme.titleMedium,
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        businessCardModel.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
//                            softWrap: true,
//                            style:Theme.of(context).textTheme.labelMedium,
                        style:
                            TextStyle(color: Color(0xffe8e8e8), fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // Icon(
                          //   Icons.location_on_outlined,
                          //   size: 18,
                          // ),
                          Expanded(
                            child: Wrap(
                                children: businessCardModel.city!
                                    .map(
                                      (e) => Text(
                                        "${e.name} ",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                        // style:Theme.of(context).textTheme.overline,
                                      ),
                                    )
                                    .toList()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_business_outlined,
                                    color: Colors.white70,
                                  ),
                                )
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
