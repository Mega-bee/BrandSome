// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// import '../style/colors.dart';
//
//
//
//
// class CustomLogOutDialog extends StatefulWidget {
//   final String title;
//   final String content;
//   final Function yesBtn;
//   final Function() noBtn;
//
//   CustomLogOutDialog(
//       {required this.title,
//         required this.content,
//         required this.yesBtn,
//         required this.noBtn});
//
//   @override
//   State<CustomLogOutDialog> createState() => _CustomLogOutDialog();
// }
//
// class _CustomLogOutDialog extends State<CustomLogOutDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       title: Text(
//         widget.title,
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontFamily: "BerlinSansFB"),
//         textAlign: TextAlign.center,
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             widget.content,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 17,
//               fontFamily: "BerlinSansFB",
//             ),
//             textAlign: TextAlign.center,
//           ),
//           // const SizedBox(
//           //   height: 10,
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                   onPressed: () {
//
//
//     widget.yesBtn();
//                   },
//                   child: Text(
//                     "Yes",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "BerlinSansFB",
//                         color: YellowColor),
//                   )),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("No",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//
//                       fontFamily: "BerlinSansFB",
//                     )),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }