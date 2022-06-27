// import 'package:brandsome/abstracts/states/state.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/filter_category_image_list.dart';
// import '../widgets/filter_service.dart';
// import '../widgets/filter_sub_category_image_list.dart';
//
// class FilterSuccessScreen extends States {
// final FilterSearchModel filterSearchModel;
// FilterSuccessScreen({required this.filterSearchModel});
//   @override
//   Widget getUI(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsetsDirectional.only(start: 18.0),
//           child: Text(
//             "Choose category",
//             style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
//           ),
//         ),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: filterSearchModel.subCategories!.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                     child: FilterCategory(filterSearchModel, () {
//                       filter.forEach((element) {
//                         element.selectedCard = false;
//                       });
//                       filter[index].selectedCard = true;
//                       setState(() {});
//                     }));
//               }),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         Padding(
//           padding: const EdgeInsetsDirectional.only(start: 18.0),
//           child: Text(
//             "Choose  sub-category",
//             style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
//           ),
//         ),
//         Container(
//           height: 200,
//           child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: filterSearchModel.subCategories!.length,,
//               itemBuilder: (context, index) {
//                 return Container(
//                     child: FilterSubCategory(filterSearchModel[index], () {
//                       filterSearchModel.forEach((element) {
//                         element.selectedCard = false;
//                       });
//                       subfilter[index].selectedCard = true;
//                       setState(() {});
//                     }));
//               }),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         Padding(
//           padding: const EdgeInsetsDirectional.only(start: 18.0),
//           child: Text(
//             "Choose service",
//             style: TextStyle(fontSize: 14, color: Color(0xff4D4B4B)),
//           ),
//         ),
//         Container(
//           child: GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//             ),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return FilterService(service[index]);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
