import 'dart:async';

import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
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
  StreamSubscription? _globalStateManager;

  @override
  void initState() {
    super.initState();
    widget.cubit.getSetting(this);
    _globalStateManager =
        getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        widget.cubit.getSetting(this);
      }
    });
  }

  void goToLogin() {
    widget.cubit.emit(RequestOtpState(this));
  }

  requestOtp(OtpRequest request) {
    widget.cubit.requestOtp(this, request);
  }

  verifyOtp(VerifyOtpRequest request) {
    widget.cubit.verifyOtp(this, request);
  }

  void logOut() {
    widget.cubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Settings",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: BlocConsumer<SettingCubit, States>(
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
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _globalStateManager?.cancel();
  }
}
