import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/setting_module/request/update_profile_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/Phone_change.dart';
import '../../response/account_response.dart';
import '../../response/settings_response.dart';
import '../../state_manager/account_state_manager.dart';
import '../state/account_state/account_edit_init.dart';
import '../state/account_state/number_otp.dart';

@injectable
class AccountInfoScreen extends StatefulWidget {
  final AccountCubit cubit;

  AccountInfoScreen(this.cubit);

  @override
  State<AccountInfoScreen> createState() => AccountInfoScreenState();
}

class AccountInfoScreenState extends State<AccountInfoScreen> {
TextEditingController newNumber=TextEditingController();
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.cubit.getAccount(this);
  }

  goToEditScreen(AccountResponse model){
    widget.cubit.emit(EditAccountInit(model , screenState: this ));
  }
  updateProfile(UpdateProfileRequest request){
    widget.cubit.updateProfile(this, request);
  }
  deleteAccount(){
    widget.cubit.deleteAccount(this);
  }
  changeMobilenum(ChangenumberRequest request){
    widget.cubit.changeMobilenum(this, request);
  }
  gotoNumberAlert(){
    widget.cubit.emit(NumberOtpState(this,));
  }
  verifyOtp(VerifyOtpRequest request){
    widget.cubit.verifyOtp(this, request);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AccountCubit, States>(
          bloc: widget.cubit,
          buildWhen: (previous, current) => !current.isListener,
          listenWhen: (previous, current) => current.isListener,
          builder: (context, state) {
            print(state);
            print('builderr');
            if (!state.isListener) {
              return state.getUI(context);
            }
            return Container();
          },
          listener: (context, state) {
            print(state);
            print('in Lisssennnerrr');
            if (state.isListener) {
              showDialog(
                  context: context,
                  builder: (context) => state.getAlert(context));
            }
          },
        );
  }
}
