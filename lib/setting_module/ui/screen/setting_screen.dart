import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/setting.dart';


@injectable
class SettingsScreen extends StatefulWidget {

  final SettingCubit cubit;
  const SettingsScreen(this.cubit);

  @override

  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool value = false;
  @override
  void initState() {
    widget.cubit.getSetting(this);
  }
  void goToLogin(){
    widget.cubit.emit( RequestOtpState(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Settings",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),

        body: BlocConsumer<SettingCubit, States>(
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
        )
    );
  }
}
