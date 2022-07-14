import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_details_module/business_details_route.dart';
import '../screen/business_screen.dart';

class BusinessCard extends StatefulWidget {
  final BusinessResponse businessCardModel;
  final Function onFollowClick;
  final BusinessScreenState screenState;

  // final bool isLoggedin;
  BusinessCard(
      {required this.businessCardModel,
      required this.onFollowClick,
      required this.screenState});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Card(
        elevation: 5,
        color: Theme.of(context).dividerColor,
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
                  imageUrl: widget.businessCardModel.image ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(strokeWidth: 1),
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
                        "id": widget.businessCardModel.id.toString(),
                        "name": widget.businessCardModel.name.toString()
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
                            widget.businessCardModel.name ?? "",
                            style: TextStyle(fontSize: 17),
                            // style:Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Text(widget.businessCardModel.viewCount
                                  .toString()),
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
                        widget.businessCardModel.description ?? "",
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
                                children: widget.businessCardModel.city!
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
                                  "${widget.businessCardModel.followCount}",
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
                                  "${widget.businessCardModel.reviewCount}",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    child: widget.businessCardModel.isFollowed!
                                        ? Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              "Unfollow",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              "  Follow  ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                          ),
                                    style: widget.businessCardModel.isFollowed!
                                        ? ElevatedButton.styleFrom(
                                            primary: Colors.black,
                                            padding: EdgeInsetsDirectional.only(
                                              end: 20,
                                              start: 20,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          )
                                        : ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            padding: EdgeInsetsDirectional.only(
                                              end: 20,
                                              start: 20,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 0,
                                                    color: Colors.transparent),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                    onPressed: () {
                                      widget.businessCardModel.isFollowed =
                                          !widget.businessCardModel.isFollowed!;
                                      setState(() {});
                                      widget.onFollowClick(
                                          widget.businessCardModel.isFollowed,);
                                    }),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.add_business_outlined,
                                //     color: Colors.white70,
                                //   ),
                                // )
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
