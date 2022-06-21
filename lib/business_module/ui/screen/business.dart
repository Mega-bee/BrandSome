import 'package:brandsome/business_module/model/business_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../home_page/ui/widgets/notification_screen.dart';
import '../../../home_page/ui/widgets/searbarfilter_screen.dart';
import '../../../utils/style/colors.dart';
import '../widget/SearchBar.dart';
import '../widget/business-card.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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

  List<BusinessCardModel> bcm = [
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
    BusinessCardModel(
        img: ImageAsset.TEST_IMAGE,
        title: "Title Here",
        subtitle:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
        titleTwo: "Country,City,Address",
        views: "1000",
        km: "5km"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: blackColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Brandsome",
              style: TextStyle(color: primaryColor),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchBarScreen()),
                );
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchBarFilterScreen()),
                );
              },
              icon: SvgPicture.asset(SvgImg.FILTER),
            ),
            PopupMenuButton(
                color: Color(0xff262626),
                icon: SvgPicture.asset(SvgImg.SORT_BY),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 0,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(ImageAsset.SORT_ICON),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "A-Z",
                              style: TextStyle(color: Colors.white),
                            ),
                            Divider(
                                thickness: 2, height: 2, color: whiteColor),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(thickness: 1, height: 2, color: whiteColor),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 1,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                ImageAsset.PERSON_ICON,
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(thickness: 1, height: 2, color: whiteColor),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 2,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                ImageAsset.VIEWS_ICON,
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Views",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(thickness: 1, height: 2, color: whiteColor),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 3,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(SvgImg.PAPER),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(thickness: 1, height: 2, color: whiteColor),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 4,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                ImageAsset.FAV_ICON,
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(thickness: 1, height: 2, color: whiteColor),
                      ],
                    ),
                  ),
                ]),


          ],
        ),
        body: ListView.builder(
            itemCount: bcm.length,
            itemBuilder: (context, index) {
              return BusinessCardScreen(
                bcm[index],
              );
            }));
  }
}