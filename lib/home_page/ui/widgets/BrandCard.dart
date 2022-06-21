import 'package:flutter/material.dart';

import '../../../hive/hive.dart';
import '../../../liked_by_module/ui/screen/liked_by_screen.dart';
import '../../../utils/components/custom_alert_dialog/CustomOtpVerificationDialog/CustomOtpVerificationDialog.dart';
import '../../../utils/components/custom_alert_dialog/CustomVerificationDialog/CustomVerificationDialog.dart';
import '../../../utils/style/colors.dart';
import '../../model/post_model.dart';

class BrandCards extends StatelessWidget {
  final postModel posts;

  BrandCards(this.posts);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("${posts.imgOne}"),
          ),
          title: Text(
            "${posts.title}",
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "${posts.subTitle}",
            style: TextStyle(color: Color(0xff898989), fontSize: 12),
          ),
        ),
        Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${posts.imgTwo}",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
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
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Properties/ ',
                        style: TextStyle(
                          fontSize: 12,
                          color: ThemeHelper().getisDark()
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Appartments/ ',
                        style: TextStyle(
                          fontSize: 12,
                          color: ThemeHelper().getisDark()
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                      TextSpan(
                          text: 'Electricians',
                          style: TextStyle(
                            fontSize: 12,
                            color: ThemeHelper().getisDark()
                                ? whiteColor
                                : blackColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "${posts.paragraph}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
