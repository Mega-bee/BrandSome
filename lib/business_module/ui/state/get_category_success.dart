import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';

import '../../../home_page/ui/widgets/filter_category_image_list.dart';
import '../../../home_page/ui/widgets/filter_service.dart';
import '../../../home_page/ui/widgets/filter_sub_category_image_list.dart';
import '../../reponse/filter_category_response.dart';

class GetCategorySuccess extends States {
 final List<FilterSearchModel> filter;
 GetCategorySuccess(this.filter);
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text(
              "Choose category",
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: filter.length,
                  itemBuilder: (context, index1) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FilterCategory(filter[index1], () {
                            // filter.forEach((element) {
                            //   element.selectedCard = false;
                            // });
                            // filter[index].selectedCard = true;
                            // setState(() {});
                          }),
                        ),
                    SizedBox(height: 30,),
                    Container(
                      height:40,
                      child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: filter[index1].subCategories!.length,
                            itemBuilder: (context, index2) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FilterSubCategory(
                                        filter[index1].subCategories ?? [], () {
                                      // subfilter.forEach((element) {
                                      //   element.selectedCard = false;
                                      // });
                                      // subfilter[index].selectedCard = true;
                                      // setState(() {});
                                    }),
                                  ),
                                  SizedBox(height: 30,),
                                  //
                                  // Container(
                                  //   height:200,
                                  //   child: GridView.builder(
                                  //     physics: NeverScrollableScrollPhysics(),
                                  //     shrinkWrap: true,
                                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  //       crossAxisCount: 2,
                                  //
                                  //     ),
                                  //     itemCount: filter[index1].subCategories![index2].services!.length,
                                  //     itemBuilder: (context, index) {
                                  //       return Container();
                                  //     },
                                  //   ),
                                  // )
                                ],
                              );

                            }),
                    )],

                    );
                  }),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Choose  sub-category",
            // ),
            // Container(
            //   height: 160,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: filter.length,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: FilterSubCategory(filter[index].subCategories, () {
            //             // subfilter.forEach((element) {
            //             //   element.selectedCard = false;
            //             // });
            //             // subfilter[index].selectedCard = true;
            //             // setState(() {});
            //           }),
            //         );
            //       }),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Choose service",
            // ),
            // Container(
            //   child: GridView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //
            //     ),
            //     itemCount: service.length,
            //     itemBuilder: (context, index) {
            //       return FilterService(service[index]);
            //     },
            //   ),
            // )
          ],),
      ),
    );
  }


}
