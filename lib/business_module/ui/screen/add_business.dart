import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/request/create_business_request.dart';
import 'package:brandsome/business_module/state_manager/add_business_bloc.dart';
import 'package:brandsome/business_module/ui/state/add_business_state/add_business_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddBusiness extends StatefulWidget {
  final AddBusinessCubit _addBusinessCubit;

  const AddBusiness(this._addBusinessCubit);

  @override
  State<AddBusiness> createState() => AddBusinessState();
}

class AddBusinessState extends State<AddBusiness> {
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  addBusinessRequest(CreateBusinessRequest request) {
    widget._addBusinessCubit.addBusiness(request, this);
  }

  @override
  void initState() {
    super.initState();
    widget._addBusinessCubit.emit(AddBusinessInit(this));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBusinessCubit, States>(
      bloc: widget._addBusinessCubit,
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
              context: context, builder: (context) => state.getAlert(context));
        }
      },
    );
  }
}
