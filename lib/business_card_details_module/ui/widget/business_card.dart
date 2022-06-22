import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/text_style.dart';
import '../../model/business_card_model.dart';

class BusinessCard extends StatelessWidget {
  final BusinessCardInfoModel businessCardInfoModel;

  BusinessCard({required this.businessCardInfoModel});

  void onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        print("Clicking add business");
        break;
      case 1:
        print("Clicking add post");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 29,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage(businessCardInfoModel.imgOne.toString()),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                businessCardInfoModel.title.toString(),
                style: TextStyle(color: whiteColor),
              ),
              PopupMenuButton(

                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(SvgImg.RATE,height: 17,),
                                  SizedBox(width: 20,),
                                  Text(
                                    "Update post",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                  thickness: 1, height: 2, color: whiteColor),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                              SizedBox(width: 13,),

                              Text(
                                "Delete post",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ])
              // IconButton(
              //     onPressed: () {
              //       print("Pressed");
              //       PopupMenuButton(
              //           color: Color(0xff262626),
              //           icon: Icon(Icons.add_circle_outline),
              //           onSelected: (item) => onSelected(context, item),
              //           itemBuilder: (context) => [
              //                 PopupMenuItem(
              //                   padding: EdgeInsets.all(10),
              //                   value: 0,
              //                   child: Column(
              //                     children: [
              //                       Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(
              //                             "Add Business",
              //                             style: TextStyle(color: Colors.white),
              //                           ),
              //                           ImageIcon(
              //                             AssetImage(
              //                                 ImageAsset.MATERIAL_BUSINESS),
              //                             color: Colors.white,
              //                           ),
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         height: 20,
              //                       ),
              //                       Divider(
              //                           thickness: 1,
              //                           height: 2,
              //                           color: whiteColor),
              //                     ],
              //                   ),
              //                 ),
              //                 PopupMenuItem(
              //                   padding: EdgeInsets.all(10),
              //                   value: 1,
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         "Add post",
              //                         style: TextStyle(color: Colors.white),
              //                       ),
              //                       ImageIcon(
              //                         AssetImage(
              //                           ImageAsset.PAPER_ICON,
              //                         ),
              //                         color: Colors.white,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ]);
              //     },
              //     icon: Icon(
              //       Icons.more_vert,
              //       color: whiteColor,
              //     ))
            ],
          ),
          subtitle: Text(
            businessCardInfoModel.subTitle.toString(),
            style: TextStyle(color: whiteColor),
          ),
        ),
        Card(
          elevation: 5,
          color: blackColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                businessCardInfoModel.imgTwo.toString(),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: whiteColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      businessCardInfoModel.titleTwo.toString(),
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Properties/ ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Appartments/ ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Electricians/ ',
                          style: StyleText.categoryStyleUnderline)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  businessCardInfoModel.paragraph.toString(),
                  style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
