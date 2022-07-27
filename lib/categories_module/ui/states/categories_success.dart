import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/categories_module/ui/screen/categories_list_screen.dart';
import 'package:brandsome/categories_module/ui/widget/category_card.dart';
import 'package:brandsome/utils/components/costom_search.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CategorySuccess extends States {
  final List<MainCategoryModel> categories;
  final CategoryListScreenState screenState;

  CategorySuccess(this.categories, this.screenState) : super(false) {
    mainCa = categories;
    if (mainCa.isNotEmpty) {
      mainCaId = mainCa.first.id ?? -1;
      if (mainCa.isNotEmpty) {
        subsCa = categories.first.subs;
        subCaId = subsCa.first.id ?? -1;
        if (subsCa.isNotEmpty) {
          serviceCa = subsCa.first.services;
        }
      }
    }
  }

  List<MainCategoryModel> mainCa = [];
  List<SubCategoryModel> subsCa = [];
  List<ServiceModel> serviceCa = [];

  int mainCaId = -1;
  int subCaId = -1;

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            S.of(context).selectCategory,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          elevation: 5,
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: IconButton(
                onPressed: () {
                  List<ServiceModel> selected = [];
                  for (var element in serviceCa) {
                    if (element.isUserInterest==true) {
                      selected.add(element);
                    }
                  }
                  Navigator.pop(context, selected);
                },
                icon: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomSearch(hintText: S.of(context).searchForService,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).chooseMainCat,),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            onCardTap: (ss) {
                              selectFirstItem(categories[index].id ?? -1);
                            },
                            catId: categories[index].id ?? 0,
                            catName: categories[index].name ?? '',
                            isSlecteced:
                                mainCaId == categories[index].id ? true : false,
                          );
                        }),
                  ),
                  Text(S.of(context).chooseSubCat,),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: subsCa.length,
                        itemBuilder: (context, indexS) {
                          return CategoryCard(
                            onCardTap: (ss) {
                              selectSecItem(subsCa[indexS].id ?? 0);
                            },
                            catId: subsCa[indexS].id ?? 0,
                            catName: subsCa[indexS].name ?? '',
                            isSlecteced:
                                subCaId == subsCa[indexS].id ? true : false,
                          );
                        }),
                  ),
                  Text(S.of(context).chooseServices,),
                  SizedBox(
//          height: 130,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2.1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        shrinkWrap: true,
                        itemCount: serviceCa.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            onCardTap: (ss) {
                              print('incardClickkc' '$ss');
                              serviceCa[index].isUserInterest = ss;
//                          screenState.selectedServiceCa.add(serviceCa[index]);
                            },
                            catId: serviceCa[index].id ?? 0,
                            catName: serviceCa[index].name ?? '',
                            isSlecteced: false,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

  void selectFirstItem(int firstCatId) {
    for (var element in mainCa) {
      if (element.id == firstCatId) {
        mainCaId = element.id ?? -1;
        subsCa = element.subs;
      }
    }
    if (subsCa.isNotEmpty) {
      selectSecItem(subsCa.first.id ?? -1);
    } else {
      serviceCa = [];
    }
    screenState.refresh();
  }

  void selectSecItem(int secCatId) {
    for (var element in subsCa) {
      if (element.id == secCatId) {
        subCaId = element.id ?? -1;
        serviceCa = element.services;
      }
    };
    screenState.refresh();
  }
}
