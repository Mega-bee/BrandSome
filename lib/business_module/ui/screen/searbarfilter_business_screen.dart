import 'package:brandsome/home_page/model/choose_category_filter_model.dart';
import 'package:brandsome/home_page/model/filter_service_model.dart';
import 'package:brandsome/home_page/model/filtrer_sub_category_model.dart';
import 'package:brandsome/home_page/ui/widgets/filter_category_image_list.dart';
import 'package:brandsome/home_page/ui/widgets/filter_service.dart';
import 'package:brandsome/home_page/ui/widgets/filter_sub_category_image_list.dart';
import 'package:brandsome/utils/components/costom_search.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@injectable
class SearchBarFilterBusinessScreen extends StatefulWidget {

  @override
  State<SearchBarFilterBusinessScreen> createState() => _SearchBarFilterBusinessScreenState();
}

class _SearchBarFilterBusinessScreenState extends State<SearchBarFilterBusinessScreen> {
  final searchbarFilter = TextEditingController();
  List<CategoryFilterModel> filter = [
    CategoryFilterModel(
        img: ImageAssetSports.BOXING,
        unselectedimg: ImageAssetUnselectedSports.BOXING,
        selectedCard: false),
    CategoryFilterModel(
        img: ImageAssetSports.DRAWING,
        unselectedimg: ImageAssetUnselectedSports.DRAWING,
        selectedCard: false),
    CategoryFilterModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    CategoryFilterModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    CategoryFilterModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
  ];

  List<FilterSubCategoryModel> subfilter = [
    FilterSubCategoryModel(
        img: ImageAssetSports.BOXING,
        unselectedimg: ImageAssetUnselectedSports.BOXING,
        selectedCard: false),
    FilterSubCategoryModel(
        img: ImageAssetSports.DRAWING,
        unselectedimg: ImageAssetUnselectedSports.DRAWING,
        selectedCard: false),
    FilterSubCategoryModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    FilterSubCategoryModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    FilterSubCategoryModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
  ];


  List<FilterServiceModel> service = [
    FilterServiceModel(
        img: ImageAssetSports.BOXING,
        unselectedimg: ImageAssetUnselectedSports.BOXING,
        selectedCard: false),
    FilterServiceModel(
        img: ImageAssetSports.DRAWING,
        unselectedimg: ImageAssetUnselectedSports.DRAWING,
        selectedCard: false),
    FilterServiceModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    FilterServiceModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    FilterServiceModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
    FilterServiceModel(
        img: ImageAssetSports.KUNG_FU,
        unselectedimg: ImageAssetUnselectedSports.KUNG_FU,
        selectedCard: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomSearch(hintText: 'Search for service'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                    Text(
                      "Choose category",
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: filter.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FilterCategory(filter[index], () {
                                filter.forEach((element) {
                                  element.selectedCard = false;
                                });
                                filter[index].selectedCard = true;
                                setState(() {});
                              }),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Choose  sub-category",
                    ),
                    Container(
                      height: 160,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: filter.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FilterSubCategory(subfilter[index], () {
                                subfilter.forEach((element) {
                                  element.selectedCard = false;
                                });
                                subfilter[index].selectedCard = true;
                                setState(() {});
                              }),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Choose service",
                    ),
                    Container(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,

                        ),
                        itemCount: service.length,
                        itemBuilder: (context, index) {
                          return FilterService(service[index]);
                        },
                      ),
                    )
                  ],),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
