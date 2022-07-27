import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../business_details_module/business_details_route.dart';
import '../screen/business_screen.dart';

class BusinessCard extends StatefulWidget {
  final BusinessResponse businessCardModel;
  final Function onFollowClick;
  final BusinessScreenState screenState;

  final bool isLoggedin;

  const BusinessCard(
      {required this.businessCardModel,
      required this.onFollowClick,
      required this.screenState,
      required this.isLoggedin});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: InkWell(
        onTap:() {
    Navigator.pushNamed(
    context, BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
    arguments: {
    "id": widget.businessCardModel.id.toString(),
    "name": widget.businessCardModel.name.toString()
    });
    },
        child: Card(




          // color: Colors.black,
          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(


                  height: 130,

                  child: CachedNetworkImage(
                    imageUrl: widget.businessCardModel.image ?? '',fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,fit: BoxFit.cover
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(strokeWidth: 1),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
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
                            widget.businessCardModel.name ?? "",
                            style: const TextStyle(fontSize: 17),
                            // style:Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (widget.isLoggedin) {
                                      widget.businessCardModel.isFollowed =
                                          !widget.businessCardModel.isFollowed!;
                                      setState(() {});
                                    }
                                    widget.onFollowClick(
                                      widget.businessCardModel.isFollowed,
                                    );
                                  },
                                  icon: widget.businessCardModel.isFollowed!
                                      ? const Icon(
                                          FontAwesomeIcons.solidHeart,
                                        )
                                      : const Icon(
                                          FontAwesomeIcons.heart,
                                        )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.businessCardModel.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
//                            softWrap: true,
//                            style:Theme.of(context).textTheme.labelMedium,
                        style: TextStyle(
                          color:Theme.of(context).brightness==Brightness.light?Colors.black: const Color(0xffe8e8e8),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
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
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                        // style:Theme.of(context).textTheme.overline,
                                      ),
                                    )
                                    .toList()),
                          ),
                        ],
                      ),
                      const SizedBox(
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
                                const SizedBox(
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
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "${widget.businessCardModel.reviewCount}",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(widget.businessCardModel.viewCount
                                    .toString()),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 18,
                                ),
                                // ElevatedButton(
                                //     child: widget.businessCardModel.isFollowed!
                                //         ? Padding(
                                //             padding: const EdgeInsets.all(1.0),
                                //             child: Text(
                                //               "Unfollow",
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.normal,
                                //                   color: Theme.of(context)
                                //                       .primaryColor),
                                //             ),
                                //           )
                                //         : Padding(
                                //             padding: const EdgeInsets.all(1.0),
                                //             child: Text(
                                //               "  Follow  ",
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.normal,
                                //                   color: Colors.white),
                                //             ),
                                //           ),
                                //     style: widget.businessCardModel.isFollowed!
                                //         ? ElevatedButton.styleFrom(
                                //             primary: Colors.black,
                                //             padding: EdgeInsetsDirectional.only(
                                //               end: 20,
                                //               start: 20,
                                //             ),
                                //             shape: RoundedRectangleBorder(
                                //                 side: BorderSide(
                                //                     width: 1,
                                //                     color: Theme.of(context)
                                //                         .primaryColor),
                                //                 borderRadius:
                                //                     BorderRadius.circular(4)),
                                //           )
                                //         : ElevatedButton.styleFrom(
                                //             primary:
                                //                 Theme.of(context).primaryColor,
                                //             padding: EdgeInsetsDirectional.only(
                                //               end: 20,
                                //               start: 20,
                                //             ),
                                //             shape: RoundedRectangleBorder(
                                //                 side: BorderSide(
                                //                     width: 0,
                                //                     color: Colors.transparent),
                                //                 borderRadius:
                                //                     BorderRadius.circular(4)),
                                //           ),
                                //     onPressed: () {
                                //       widget.businessCardModel.isFollowed =
                                //           !widget.businessCardModel.isFollowed!;
                                //       setState(() {});
                                //       widget.onFollowClick(
                                //         widget.businessCardModel.isFollowed,
                                //       );
                                //     }),
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
            ],
          ),
        ),
      ),
    );
  }
}
