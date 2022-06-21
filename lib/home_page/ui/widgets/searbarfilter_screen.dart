import 'package:flutter/material.dart';

import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';
import '../../model/choose_category_filter_model.dart';
import '../../model/filter_service_model.dart';
import '../../model/filtrer_sub_category_model.dart';
import 'filter_category_image_list.dart';
import 'filter_service.dart';
import 'filter_sub_category_image_list.dart';

class SearchBarFilterScreen extends StatefulWidget {

  @override
  State<SearchBarFilterScreen> createState() => _SearchBarFilterScreenState();
}

class _SearchBarFilterScreenState extends State<SearchBarFilterScreen> {
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
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 25.0, top: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(fontSize: 12),
                        controller: searchbarFilter,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search for services",
                          contentPadding: EdgeInsetsDirectional.only(start: 10,end: 10),

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose category",
                style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: filter.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: FilterCategory(filter[index], () {
                        filter.forEach((element) {
                          element.selectedCard = false;
                        });
                        filter[index].selectedCard = true;
                        setState(() {});
                      }));
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose  sub-category",
                style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: filter.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: FilterSubCategory(subfilter[index], () {
                        subfilter.forEach((element) {
                          element.selectedCard = false;
                        });
                        subfilter[index].selectedCard = true;
                        setState(() {});
                      }));
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose service",
                style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
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
            ],
          ),
        ),
      ),
    );
  }
}
