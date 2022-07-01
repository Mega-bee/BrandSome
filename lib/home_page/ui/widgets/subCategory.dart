//import 'package:flutter/material.dart';
//
//import '../../model/subCategory.dart';
//
//class SubCategoryCard extends StatefulWidget {
//  final SubCategoryModel subcate;
//  final Function onCardTAP;
//
//
//  SubCategoryCard(this.subcate, this.onCardTAP ,);
//
//  @override
//  State<SubCategoryCard> createState() => _subCategoryState();
//}
//
//class _subCategoryState extends State<SubCategoryCard> {
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: (){
//        // widget.subcate.selectedCard = ! widget.subcate.selectedCard;
//        // setState(() {
//        //
//        // });
//        // widget.onCardTAP();
//      },
//      child: Padding(
//        padding: const EdgeInsets.all(6.0),
//        child:  Image.asset(widget.subcate.img!)
//      ),
//    );
//
//
//
//    ///card with icon and text
//    // return Card(
//    //     shape: RoundedRectangleBorder(
//    //         borderRadius: BorderRadius.circular(4)),
//    //     color: Color(0xff1E1513),
//    //     child: Padding(
//    //       padding: const EdgeInsets.all(12.0),
//    //       child: Column(
//    //         mainAxisAlignment: MainAxisAlignment.center,
//    //         children: [
//    //           Text(
//    //             "${subcate.name!}",
//    //             style: TextStyle(color: Colors.white),
//    //           ),
//    //           SizedBox(
//    //             height: 20,
//    //           ),
//    //           Image.asset('${subcate.img}'),
//    //           SizedBox(
//    //             height: 20,
//    //           ),
//    //           Text(
//    //             "${subcate.subName}",
//    //             style: TextStyle(
//    //               color: Colors.white,
//    //             ),
//    //           ),
//    //         ],
//    //       ),
//    //     ));
//  }
//}
