import 'package:brandsome/business_module/model/business_card.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:brandsome/utils/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';

class BusinessCardScreen extends StatelessWidget {
  final BusinessCardModel businessCardModel;

  BusinessCardScreen(this.businessCardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10),
      child: Container(
        child: Card(
          color: Color(0xff1E1513),
          child: Row(
            children: [
              Image.asset(businessCardModel.img!),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${businessCardModel.title}",style: StyleText.Title,),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.16),
                        Icon(Icons.remove_red_eye_outlined,color: whiteColor,size: 13,),
                        SizedBox(width: 3),
                        Text("${businessCardModel.views}",style: StyleText.categoryStylesmall,),
                      ],
                    ),
                    SizedBox(height: 7,),

                    // Text("${businessCardModel.subtitle}",
                    //  style: StyleText.categoryStyle,),
                    SizedBox(height: 7,),

                    Row(
                      children: [
                        Text("${businessCardModel.titleTwo}",style: StyleText.categoryStyle,),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                        Icon(Icons.location_on_outlined,color: Colors.white60,size: 15,),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text("${businessCardModel.km}",style: StyleText.KM,),
                        ),
                      ],
                    ),
                    SizedBox(height: 7,),

                    Row(
                      children: [
                        ImageIcon(
                          AssetImage(ImageAssetSocialMedia.PERSON,),
                          color: Colors.white,
                        ),
                        Text("500",style: StyleText.categoryStyle,),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                        ImageIcon(
                          AssetImage(ImageAssetSocialMedia.RATE,),
                          color: Colors.white,
                        ),
                        Text("10",style: StyleText.categoryStyle,),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                        ImageIcon(
                          AssetImage(ImageAsset.PAPER_ICON,),
                          color: Colors.white,
                        ),
                        Text("10",style: StyleText.categoryStyle,),
                      ],
                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
