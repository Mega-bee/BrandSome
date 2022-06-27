import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../business_module/state_manager/business_list_bloc.dart';
import '../../state_manager/business_list_bloc.dart';

@injectable
class BusnessDetailsScreen extends StatefulWidget {
  final BusinessListDetailsCubit _businessListDetailsCubit;
  BusnessDetailsScreen( this._businessListDetailsCubit);
  @override
  State<BusnessDetailsScreen> createState() => BusnessDetailsScreenState();
}

class BusnessDetailsScreenState extends State<BusnessDetailsScreen> with SingleTickerProviderStateMixin{
  String? id = "-1";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && id == "-1") {
      id = args as String;
      widget._businessListDetailsCubit.getBusinessDetails(this, id);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Text(
            "Business Details",
          ),
        ),
      ),
      body:  BlocBuilder<BusinessListDetailsCubit, States>(
          bloc: widget._businessListDetailsCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }


}
