import 'package:flutter/material.dart';

import '../../../hive/hive.dart';
import '../../../home_page/model/choose_category_filter_model.dart';
import '../../../home_page/model/filter_service_model.dart';
import '../../../home_page/model/filtrer_sub_category_model.dart';
import '../../../home_page/ui/widgets/filter_category_image_list.dart';
import '../../../home_page/ui/widgets/filter_service.dart';
import '../../../home_page/ui/widgets/filter_sub_category_image_list.dart';
import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';


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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              TextField(
                cursorColor:
                ThemeHelper().getisDark() ? whiteColor : blackColor,
                style: const TextStyle(fontSize: 14),
                controller: searchbarFilter,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                    color: ThemeHelper().getisDark()
                        ? whiteColor
                        : blackColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 18,
                      color: ThemeHelper().getisDark()
                          ? whiteColor
                          : blackColor,
                    ),
                  ),
                  filled: true,
                  hintText: "Search for services",
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      borderSide: BorderSide(
                        width: 2,
                        color: ThemeHelper().getisDark()
                            ? Colors.black
                            : Colors.white,
                      )),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 25.0, top: 20.0),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 18.0),
                child: Text(
                  "Choose category",
                  style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
                ),
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
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 18.0),
                child: Text(
                  "Choose  sub-category",
                  style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
                ),
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
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 18.0),
                child: Text(
                  "Choose service",
                  style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
                ),
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
