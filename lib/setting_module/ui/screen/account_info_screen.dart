import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../response/account_response.dart';
import '../../response/settings_response.dart';
import '../../state_manager/account_state_manager.dart';
import '../state/account_state/account_edit_init.dart';

@injectable
class AccountInfoScreen extends StatefulWidget {
  final AccountCubit cubit;

  AccountInfoScreen(this.cubit);

  @override
  State<AccountInfoScreen> createState() => AccountInfoScreenState();
}

class AccountInfoScreenState extends State<AccountInfoScreen> {
 late  AccountResponse accountModel;


  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    accountModel = AccountResponse();
    widget.cubit.getAccount(this);
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.cubit.emit(EditAccountInit(
                    accountModel,
                      screenState: this,
                      onSaveClick: (request) {
                        widget.cubit.updateProfile(this,request);
                      }));
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AccountCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
