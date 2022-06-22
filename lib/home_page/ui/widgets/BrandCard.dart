import 'package:flutter/material.dart';

import '../../../liked_by_module/ui/screen/liked_by_screen.dart';
import '../../../utils/components/custom_alert_dialog/CustomOtpVerificationDialog/CustomOtpVerificationDialog.dart';
import '../../../utils/components/custom_alert_dialog/CustomVerificationDialog/CustomVerificationDialog.dart';
import '../../model/post_model.dart';

class PostCard extends StatelessWidget {
  final postModel posts;

  PostCard(this.posts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("${posts.imgOne}"),
              ),
              title: Text(
                "${posts.title}",
              ),
              subtitle: Text(
                "${posts.subTitle}",
              ),
            ),
            Image.network(
              "${posts.imgTwo}",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0,end: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomVerificationDialog(
                              title: "Verification",
                              content: "",
                              continueBtn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CustomOtpVerificationDialog(
                                            continueBtn: () {},
                                            title: 'OTP verification',
                                            content: '',
                                          )),
                                );
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.thumb_up_alt_outlined,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikeByScreen()),
                          );
                        },
                        child: Text(
                          "${posts.titleTwo}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Properties/Appartments/Electricians",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                  ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 15.0),
//                  child: RichText(
//                    text: TextSpan(
//                      children: <TextSpan>[
//                        TextSpan(
//                          text: 'Properties/ ',
//                        ),
//                        TextSpan(
//                          text: 'Appartments/ ',
//                          style: TextStyle(
//                            fontSize: 12,
//                          ),
//                        ),
//                        TextSpan(
//                            text: 'Electricians',
//                            style: TextStyle(
//                              fontSize: 12,
//                            ))
//                      ],
//                    ),
//                  ),
//                ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${posts.paragraph}",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
