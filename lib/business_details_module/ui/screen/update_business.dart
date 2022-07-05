import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_details_module/reponse/business_response.dart';
import 'package:brandsome/business_details_module/request/edit_business_request.dart';
import 'package:brandsome/business_module/state_manager/add_business_bloc.dart';
import 'package:brandsome/business_module/ui/state/add_business_state/add_business_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../state_manager/business_details_state_manager.dart';
import '../state/update_business_success.dart';

@injectable
class UpdateBusiness extends StatefulWidget {
  final BusinessListDetailsCubit _businessListDetailsCubit;

  const UpdateBusiness(this._businessListDetailsCubit);

  @override
  State<UpdateBusiness> createState() => UpdateBusinessState();
}

class UpdateBusinessState extends State<UpdateBusiness> {
  late EditBusinessRequest request;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  EditBusinessrequest() {
    widget._businessListDetailsCubit.editBusiness(request,this);
  }

  @override
  void initState() {
    super.initState();
    request = EditBusinessRequest(cities: [],services: []);

  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is BusinessInfoResponse) {
      widget._businessListDetailsCubit.emit(UpdateBusinessSuccess(this,args));
    }
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Edit business",
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                  onPressed: () {
                    EditBusinessrequest();
                  },
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ))),
        ],
      ),
      body: BlocBuilder<BusinessListDetailsCubit, States>(
          bloc: widget._businessListDetailsCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
