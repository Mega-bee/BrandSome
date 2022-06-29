import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../request/add_review_request.dart';
import '../../state_manager/business_details_state_manager.dart';

@injectable
class BusnessDetailsScreen extends StatefulWidget {
  final BusinessListDetailsCubit _businessListDetailsCubit;
  BusnessDetailsScreen( this._businessListDetailsCubit);
  @override
  State<BusnessDetailsScreen> createState() => BusnessDetailsScreenState();
}

class BusnessDetailsScreenState extends State<BusnessDetailsScreen>
    with TickerProviderStateMixin{
  String? id = "-1";

  clickCall(String? number){
    widget._businessListDetailsCubit.PostCall(this , id,number);
  }
  createReview(AddReviewRequest request){
    widget._businessListDetailsCubit.createReview(request,this);
  }




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
        elevation: 5,
        title: Text(
          "Business Details",
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
