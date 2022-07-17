import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../reponse/add_location_response.dart';
import '../../state_manager/location_state_manager.dart';

@injectable
class AddLocationScreen extends StatefulWidget {
  final GeneralDataCubit locationCubit;
  const AddLocationScreen(this.locationCubit);
  @override
  State<AddLocationScreen> createState() => AddLocationScreenState();
}

class AddLocationScreenState extends State<AddLocationScreen> {
  List<AddLocationResponse> alreadySelect = [];
  bool flags = true;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    if(flags){
      flags = false;
      var args = ModalRoute.of(context)?.settings.arguments;
      if(args != null){
        print('in Flage');
        alreadySelect = args as List<AddLocationResponse>;
        print(alreadySelect);
      }
      widget.locationCubit.getLocation(this, alreadySelect);
    }
    return BlocBuilder<GeneralDataCubit, States>(
        bloc: widget.locationCubit,
        builder: (context, state) {
          return state.getUI(context);
        });
  }

  @override
  void initState() {
    super.initState();
  }
}
