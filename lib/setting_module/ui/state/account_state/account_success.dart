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
        centerTitle: true,
        title: Text(
          "Account Info",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
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
            const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 150,
              width: 150,
              child: CustomNetworkImage(
               imageSource: accountModel.imageUrl ??'',
              ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 38.0, start: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ListTile(title: const Text('User name'),
                 subtitle: Text(accountModel.userName ?? ''),
                   leading: const Icon(Icons.person),
                 ),
                  const Divider(thickness: 3,),

                  ListTile(title: const Text('Phone Number'),
                    subtitle: Text(accountModel.phoneNumber ?? ''),
                    leading: const Icon(Icons.phone_android),
                  ),
                  const Divider(thickness: 3,),


                  ListTile(title: const Text('Brithday'),
                    subtitle: Text(accountModel.birthDate ?? ''),
                    leading: const Icon(Icons.cake),
                  ),
                  const Divider(thickness: 3,),



                  ListTile(title: const Text('Gender'),
                    subtitle: Text(accountModel.gender ?? ''),
                    leading: const Icon(Icons.transgender),
                  ),
                  const Divider(thickness: 3,)
                ],
              ),
            ),
            const SizedBox(
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