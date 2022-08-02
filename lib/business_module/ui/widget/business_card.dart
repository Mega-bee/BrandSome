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
      padding: const EdgeInsetsDirectional.only(
        start: 5,
        end: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
              arguments: {
                "id": widget.businessCardModel.id.toString(),
                "name": widget.businessCardModel.name.toString()
              });
        },
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 130,
                    child: CachedNetworkImage(
                      imageUrl: widget.businessCardModel.image ?? '',
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(strokeWidth: 1),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Text(
                                      widget.businessCardModel.name ?? "",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
//                                       style:Theme.of(context).textTheme.headlineSmall,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (widget.isLoggedin) {
                                        widget.businessCardModel.isFollowed =
                                            !widget
                                                .businessCardModel.isFollowed!;
                                        setState(() {});
                                      }
                                      widget.onFollowClick(
                                        widget.businessCardModel.isFollowed,
                                      );
                                    },
                                    icon: widget.businessCardModel.isFollowed!
                                        ? const Icon(
                                            FontAwesomeIcons.solidHeart,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.9),
                                            size: 18,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.heart,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.9),
                                            size: 18,
                                          )),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.businessCardModel.description ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                              ),

//                            softWrap: true,
//                              style:Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Wrap(
                                  spacing: 3,
                                  children: widget.businessCardModel.city!
                                      .map(
                                        (e) => Container(
                                          color: Colors.grey[900],
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              "${e.name} ",
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                              // style:Theme.of(context).textTheme.overline,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_outlined,
                                size: 17,
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
                              Icon(
                                Icons.rate_review_outlined,
                                size: 15,
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
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.businessCardModel.viewCount.toString(),

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
