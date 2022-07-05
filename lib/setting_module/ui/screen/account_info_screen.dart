import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
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
  late AccountResponse accountModel;

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
                  widget.cubit.emit(EditAccountInit(accountModel,
                      screenState: this, onSaveClick: (request) {
                    widget.cubit.updateProfile(this, request);
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
        body: BlocConsumer<AccountCubit, States>(
          bloc: widget.cubit,
          buildWhen: (previous, current) => !current.lis,
          listenWhen: (previous, current) => current.lis,
          builder: (context, state) {
            print(state);
            print('builderr');
            if (!state.lis) {
              return state.getUI(context);
            }
            return Container();
          },
          listener: (context, state) {
            print(state);
            print('in Lisssennnerrr');
            if (state.lis) {
              showDialog(
                  context: context,
                  builder: (context) => state.getAlert(context));
            }
          },
        ));
  }
}
