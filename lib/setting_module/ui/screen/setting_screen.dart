import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../../../abstracts/states/state.dart';
import '../../../business_module/request/bussines_filter_request.dart';
import '../../../follower_module/ui/screens/follower_list.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/service/theme_serrvice/theme_service.dart';
import '../../response/settings_response.dart';
import '../../state_manager/setting.dart';
import '../widget/account_info.dart';
import '../../../business_module/ui/screen/add_business.dart';

@injectable
class SettingsScreen extends StatefulWidget {

  final SettingCubit cubit;
  const SettingsScreen(this.cubit);

  @override

  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = false;
  @override
  void initState() {

    widget.cubit.getSetting();
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

        body: BlocBuilder<SettingCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            })
    );
  }
}
