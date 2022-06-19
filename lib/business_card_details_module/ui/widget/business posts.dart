import 'package:flutter/material.dart';

import '../../../utils/images/images.dart';
import '../../model/business_card_model.dart';
import 'business_card.dart';

class BusinessPosts extends StatefulWidget {
  List<BusinessCardInfoModel> postinfo = [
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter Tohme",
        subTitle: "Zahle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter Tohme",
        subTitle: "Zahle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Subtitle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Title",
        subTitle: "Subtitle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    BusinessCardInfoModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Title",
        subTitle: "Subtitle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
  ];

  @override
  State<BusinessPosts> createState() => _BusinessPostsState();
}

class _BusinessPostsState extends State<BusinessPosts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.postinfo.length,
        itemBuilder: (context, index) {
          return BusinessCard(
            businessCardInfoModel: widget.postinfo[index],
          );
        });
  }
}
