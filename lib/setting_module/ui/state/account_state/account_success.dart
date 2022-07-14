import 'package:brandsome/setting_module/response/account_response.dart';
import 'package:brandsome/setting_module/ui/screen/account_info_screen.dart';
import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../abstracts/states/state.dart';
import '../../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';

class AccountSuccess extends States {
  final AccountResponse accountModel;
  final AccountInfoScreenState _screenState;
  AccountSuccess(this._screenState, {required this.accountModel}) : super(false);
  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Account Info",
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: IconButton(
              onPressed: () {
                _screenState.goToEditScreen(accountModel);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 150,
              width: 150,
              child: CustomNetworkImage(
               imageSource: accountModel.imageUrl ??'',
              ),
              ),
            ),
            SizedBox(height: 10,),
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
                            _screenState.deleteAccount();


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
                          .primaryColor),
                ),
              ),
            ), // SizedBox(height: 200,),
          ],
        ),
      ),
    );
  }


  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}