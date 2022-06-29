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
