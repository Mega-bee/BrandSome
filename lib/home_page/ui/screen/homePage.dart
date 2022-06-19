import 'package:brandsome/home_page/model/category_model.dart';
import 'package:brandsome/home_page/model/subCategory.dart';
import 'package:brandsome/utils/style/colors.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/images/images.dart';
import '../../model/post_model.dart';
import '../widgets/BrandCard.dart';
import '../widgets/notification_screen.dart';
import '../widgets/searbar_screen.dart';
import '../widgets/Category.dart';
import '../widgets/subCategory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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

  List<CategoryModel> categorys = [
    CategoryModel(id: 1, name: "Personal", selectedCard: true),
    CategoryModel(id: 2, name: "Properties", selectedCard: false),
    CategoryModel(id: 3, name: "Cars", selectedCard: false),
  ];

  List<subCategoryModel> subCat = [
    subCategoryModel(
        id: 1,
        img: ImageAssetSports.BOXING,
        unselectedImg: ImageAssetUnselectedSports.BOXING,
        selectedCard: false),
    subCategoryModel(
        id: 2,
        img: ImageAssetSports.DRAWING,
        unselectedImg: ImageAssetUnselectedSports.DRAWING,
        selectedCard: false),
    subCategoryModel(
        id: 3,
        img: ImageAssetSports.KUNG_FU,
        unselectedImg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    subCategoryModel(
        id: 4,
        img: ImageAssetSports.MUAY_THAI,
        unselectedImg: ImageAssetUnselectedSports.MUAY_THAI,
        selectedCard: false),
    subCategoryModel(
        id: 5,
        img: ImageAssetSports.PERSONAL_TRAINER,
        unselectedImg: ImageAssetUnselectedSports.PERSONAL_TRAINER,
        selectedCard: false),
    subCategoryModel(
        id: 6,
        img: ImageAssetSports.PING_PONG,
        unselectedImg: ImageAssetUnselectedSports.PING_PONG,
        selectedCard: false),
  ];

  List<postModel> post = [
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter Tohme",
        subTitle: "Zahle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter Tohme",
        subTitle: "Zahle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Zahle, lebanon",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Peter",
        subTitle: "Subtitle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
        imgOne: ImageAsset.TEST_IMAGE,
        title: "Title",
        subTitle: "Subtitle",
        imgTwo:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        paragraph:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et ",
        titleTwo: "Liked by 28 visitors"),
    postModel(
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
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
          PopupMenuButton(
              color: Color(0xff262626),
              icon: Icon(Icons.add_circle_outline),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.all(10),
                      value: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add Business",
                                style: TextStyle(color: Colors.white),
                              ),
                              ImageIcon(
                                AssetImage(ImageAsset.MATERIAL_BUSINESS),
                                color: Colors.white,
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
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add post",
                            style: TextStyle(color: Colors.white),
                          ),
                          ImageIcon(
                            AssetImage(
                              ImageAsset.PAPER_ICON,
                            ),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ]),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              icon: Icon(Icons.notifications_none),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Category(categorys[index], () {
                          categorys.forEach((element) {
                            element.selectedCard = false;
                          });
                          categorys[index].selectedCard = true;
                          setState(() {});
                        }));
                  }),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: subCat.length,
                itemBuilder: (context, index) {
                  return Container(
                      // width: MediaQuery.of(context).size.width * 0.400,
                      child: subCategory(subCat[index], () {}
                          //   subCat.forEach((element) {
                          //     element.selectedCard = false;
                          //   });
                          // subCat[index].selectedCard = true;
                          // setState(() {
                          //
                          // });
                          // }
                          ));
                }),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchBarScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "Choose interests",
                  style: TextStyle(
                      color: primaryColor,
                      decoration: TextDecoration.underline,
                      fontSize: 9),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 3,
            color: Color(0xff171717),
          ),
          SizedBox(
            height: 12,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: post.length,
              itemBuilder: (context, index) {
                return BrandCards(post[index]);
              })
        ]),
      ),
    );
  }
}
