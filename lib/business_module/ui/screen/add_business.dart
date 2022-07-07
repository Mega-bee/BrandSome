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
  late AddBusinessRequest request;

//  List<AddLocationResponse> selectedLocation = [];

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  addBusinessRequest() {
    widget._addBusinessCubit.addBusiness(request, this);
  }

  @override
  void initState() {
    super.initState();
    request = AddBusinessRequest(cities: [],services: []);
    widget._addBusinessCubit.emit(AddBusinessInit(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Add business",
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                  onPressed: () {
                    addBusinessRequest();
                  },
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ))),
        ],
      ),
      body: BlocBuilder<AddBusinessCubit, States>(
          bloc: widget._addBusinessCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
