import 'package:brandsome/utils/style/colors.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../liked_by_module/ui/screen/liked_by_screen.dart';
import '../../../utils/components/custom_alert_dialog/CustomOtpVerificationDialog/CustomOtpVerificationDialog.dart';
import '../../../utils/components/custom_alert_dialog/CustomVerificationDialog/CustomVerificationDialog.dart';
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
            style: TextStyle(color: whiteColor, fontSize: 16),
          ),
          subtitle: Text(
            "${posts.subTitle}",
            style: TextStyle(color: Color(0xff898989), fontSize: 12),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Color(0xff171717),
          color: blackColor,
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
                                MaterialPageRoute(builder: (context) => CustomOtpVerificationDialog(continueBtn: (){}, title: 'OTP verification', content: '',)),
                              );
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LikeByScreen()),
                        );
                      },
                      child: Text(
                        "${posts.titleTwo}",
                        style: TextStyle(color: whiteColor, fontSize: 16),
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
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Appartments/ ',
                          style: StyleText.categoryStyleGreyColor),
                      TextSpan(
                          text: 'Electricians',
                          style: StyleText.categoryStyleUnderline)
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
                  style: TextStyle(color: Color(0xffDFDFDF), fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Color(0xff171717),
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
