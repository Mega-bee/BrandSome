import 'package:brandsome/setting_module/response/account_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../abstracts/states/state.dart';
import '../../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';

class AccountSuccess extends States {
  final AccountResponse accountModel;
  AccountSuccess({required this.accountModel});
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Stack(children: [
                Container(
                width: 130,
                height: 130,
                child: CachedNetworkImage(
                  imageUrl: accountModel.imageUrl.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),]),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 38.0, start: 27.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ListTile(title: Text('User name'),
               subtitle: Text(accountModel.userName ?? ''),
                 leading: Icon(Icons.person),
               ),
                Divider(thickness: 3,),

                ListTile(title: Text('Phone Number'),
                  subtitle: Text(accountModel.phoneNumber ?? ''),
                  leading: Icon(Icons.phone_android),
                ),
                Divider(thickness: 3,),


                ListTile(title: Text('Brithday'),
                  subtitle: Text(accountModel.birthDate ?? ''),
                  leading: Icon(Icons.cake),
                ),
                Divider(thickness: 3,),



                ListTile(title: Text('Gender'),
                  subtitle: Text(accountModel.gender ?? ''),
                  leading: Icon(Icons.transgender),
                ),
                Divider(thickness: 3,)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      CustomDeleteDialog(
                        title: "Delete account",
                        content: "",
                        yesBtn: () {
                          Navigator.pop(context);
                        },
                        noBtn: () {
                          Navigator.pop(context);
                        },
                      ),
                );
              },
              child: Text(
                "Delete account",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ), // SizedBox(height: 200,),
        ],
      ),
    );
  }
}