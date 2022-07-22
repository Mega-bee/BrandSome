import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/ui/widget/category_card.dart';
import 'package:brandsome/home_page/model/category_model.dart';
import 'package:brandsome/home_page/request/is_like.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../categories_module/reponse/category_response.dart';
import '../../../generated/l10n.dart';
import '../../../posts_module/ui/widgets/post_card.dart';
import '../../home_route.dart';
import '../../request/userInterestsRequest.dart';
import '../../response/home_page.dart';
import '../widgets/main_cate_card.dart';
import '../widgets/sub_service_card.dart';

class HomePageSuccess extends States {
  final HomePageScreenState screenState;
  final List<Post> posthome;
  final List<MainCategoryModel> mainCategory;

  final bool isLogged;

  HomePageSuccess(
    this.screenState,
    this.posthome,
    this.isLogged,
    this.mainCategory,
  ) : super(false) {
    if (screenState.isFlag) {
      if (mainCategory.isNotEmpty) {
        mainCaId = mainCategory.first.id ?? -1;
        if (mainCategory.isNotEmpty) {
          subsCa = mainCategory.first.subs;
          subCaId = subsCa.first.id ?? -1;
          if (subsCa.isNotEmpty) {
            serviceCa = subsCa.first.services;
          }
        }
      }
    }
  }

  List<SubCategoryModel> subsCa = [];
  List<ServiceModel> serviceCa = [];

  int mainCaId = -1;
  int subCaId = -1;

  void selectFirstItem(int firstCatId) {
    for (var element in mainCategory) {
      if (element.id == firstCatId) {
        mainCaId = element.id ?? -1;
        subsCa = element.subs;
      }
    }
    if (subsCa.isNotEmpty) {
      serviceCa = subsCa.first.services;
    }
    screenState.refresh();
  }
  List<int> serviceId = [];
  setUserInterestsRequest request =
  setUserInterestsRequest(id: []);
  @override
  Widget getUI(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mainCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MainCategoryCard(mainCategory[index], () {
                        selectFirstItem(mainCategory[index].id ?? -1);
                        // for (var element in mainCategory) {
                        //   element.isSelected = false;
                        // }
                        // mainCategory[index].isSelected = true;
                      }));
                }),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        subsCa.isEmpty
            ? SizedBox(
                height: 150,
              )
            : SizedBox(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: serviceCa.length,
                    itemBuilder: (context, index) {
                      return SubServieCard(
                        subId: subsCa[0].id ?? -1,
                        subName: subsCa[0].name ?? "",
                        serviceImage: serviceCa[index].image.toString(),
                        serviceName: serviceCa[index].name ?? "",
                        isSlecteced: false,
                        onCardTap: () {},

                      );
                    }),
              ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context,
                  HomeRoutes.CATEGORY_LIST_SCREEN).then((value) {
                    value as List<ServiceModel>;
                    for (var element in value) {
                      serviceId.add(element.id??-1);

                    }
                    ///request
                    request.id = serviceId;
                    print("ServiceId:${serviceId}");

                  });
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 8.0, start: 10, top: 5, bottom: 13),
              child: Text(
                S.of(context).chooseInterests,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 3,
        ),
        ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: posthome.length,
            itemBuilder: (context, index) {
              return PostCard(
                  isLogged: isLogged,
                  onLikeClick: (like) {
                    screenState.Islike(
                        LikeRequest(
                          isLike: like,
                        ),
                        posthome[index].id.toString());
                  },
                  onViewLikeTap: (id) {
                    screenState.goToLikes(id);
                  },
                  posthome: posthome[index]);
            }),
        const SizedBox(
          height: 55,
        ),
      ]),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
