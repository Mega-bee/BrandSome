import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  bool? isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              // width: MediaQuery.of(context).size.width * 0.400,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0xff1E1513),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sports",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/images/Group 354.png'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Personal Trainer",
                          style: TextStyle(color: Colors.white,),
                        ),
                      ],
                    ),
                  )),
            );
            // return Row(
            //   children: [
            //     Container(
            //       height: 200,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Card(
            //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            //          color:  Color(0xff1E1513),
            //           child: Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   'Sports',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //                 SizedBox(height: 20,),
            //                 Image.asset('assets/images/Group 354.png'),
            //                 SizedBox(height: 20,),
            //
            //                 Text(
            //                   'Personal Trainer',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            //    );
          }),
    );
  }
}
