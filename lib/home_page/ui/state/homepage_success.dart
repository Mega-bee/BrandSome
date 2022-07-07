import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/ui/widget/category_card.dart';
import 'package:brandsome/home_page/model/category_model.dart';
import 'package:brandsome/home_page/model/subCategory.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/images/images.dart';
import '../../../posts_module/reponse/posts_reponse.dart';
import '../../../posts_module/ui/widgets/post_card.dart';
import '../../response/home_page.dart';
import '../widgets/main_cate_card.dart';

class HomePageSuccess extends States {
  final HomePageScreenState screenState;
  final List <Post> posthome;


  HomePageSuccess( this.screenState,this.posthome) : super(false);

  List<CategoryModel> categorys = [
    CategoryModel(id: 1, name: "Personal", selectedCard: true),
    CategoryModel(id: 2, name: "Properties", selectedCard: false),
    CategoryModel(id: 3, name: "Cars", selectedCard: false),
  ];

  List<SubCategoryModel> subCat = [
    SubCategoryModel(
        id: 1,
        img: ImageAssetSports.BOXING,
        unselectedImg: ImageAssetUnselectedSports.BOXING,
        selectedCard: false),
    SubCategoryModel(
        id: 2,
        img: ImageAssetSports.DRAWING,
        unselectedImg: ImageAssetUnselectedSports.DRAWING,
        selectedCard: false),
    SubCategoryModel(
        id: 3,
        img: ImageAssetSports.KUNG_FU,
        unselectedImg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    SubCategoryModel(
        id: 4,
        img: ImageAssetSports.MUAY_THAI,
        unselectedImg: ImageAssetUnselectedSports.MUAY_THAI,
        selectedCard: false),
    SubCategoryModel(
        id: 5,
        img: ImageAssetSports.PERSONAL_TRAINER,
        unselectedImg: ImageAssetUnselectedSports.PERSONAL_TRAINER,
        selectedCard: false),
    SubCategoryModel(
        id: 6,
        img: ImageAssetSports.PING_PONG,
        unselectedImg: ImageAssetUnselectedSports.PING_PONG,
        selectedCard: false),
  ];





  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categorys.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MainCategoryCard(

                          categorys[index], () {
                        categorys.forEach((element) {
                          element.selectedCard = false;
                        });
                        categorys[index].selectedCard = true;
                      }));
                }),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 150,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: subCat.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  isSlecteced: false,
                  catName: 'personal',
                  onCardTap: () {},
                  catId: -1,
                );
              }),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => SearchBarFilterScreen()),
              // );
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 8.0, start: 10, top: 5, bottom: 13),
              child: Text(
                "Choose interests",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 3,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: posthome.length,
            itemBuilder: (context, index) {
              return PostCard(onLikeTap: (){
                screenState.goToLikes();
              },posthome: posthome[index]);
            })
      ]),
    );
  }
  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
