import 'package:brandsome/setting_module/response/account_response.dart';
import 'package:brandsome/setting_module/ui/screen/account_info_screen.dart';
import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../abstracts/states/state.dart';
import '../../../../generated/l10n.dart';
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
          S.of(context).accountInfo,
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
                 ListTile(title: Text(S.of(context).userName,style: TextStyle(color:Colors.grey),),
                 subtitle: Text(accountModel.userName ?? '',style: TextStyle(color: Color(0xFFE8E8E8)),),
                   leading: Icon(Icons.person,size: 40,color:Colors.grey,),
                 ),
                  Divider(thickness: 3,),

                  ListTile(title: Text(S.of(context).phoneNumber,style: TextStyle(color:Colors.grey),),

                    subtitle: Text(accountModel.phoneNumber ?? '',style: TextStyle(color: Color(0xFFE8E8E8)),),
                    leading: const Icon(Icons.phone_android,size: 40,color:Colors.grey,),
                  ),
                  const Divider(thickness: 3,),


                  ListTile(title: Text(S.of(context).birthdayDate,style: TextStyle(color:Colors.grey),),
                    subtitle: Text(accountModel.birthDate ?? '',style: TextStyle(color: Color(0xFFE8E8E8)),),
                    leading: const Icon(Icons.cake,size: 40,color:Colors.grey,),
                  ),
                  const Divider(thickness: 3,),



                  ListTile(title: Text(S.of(context).Gender,style: TextStyle(color:Colors.grey),),
                    subtitle: Text(accountModel.gender ?? '',style: TextStyle(color: Color(0xFFE8E8E8)),),
                    leading: Icon(Icons.transgender,size: 40,color:Colors.grey,),
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
                          title: S.of(context).deleteAccount,
                          content: "",
                          yesBtn: () {
                            _screenState.deleteAccount();
                            Navigator.pop(context);


                          },
                          noBtn: () {
                            Navigator.pop(context);
                          },
                        ),
                  );
                },
                child: Text(
                  S.of(context).deleteAccount,
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