
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../request/add_review_request.dart';
import '../../request/is_follow.dart';
import '../../state_manager/business_details_state_manager.dart';

@injectable
class BusnessDetailsScreen extends StatefulWidget {
  final BusinessListDetailsCubit _businessListDetailsCubit;
  BusnessDetailsScreen(this._businessListDetailsCubit);
  @override
  State<BusnessDetailsScreen> createState() => BusnessDetailsScreenState();
}

class BusnessDetailsScreenState extends State<BusnessDetailsScreen>
    with TickerProviderStateMixin {
  String? id = "-1";
  String? name = "";

  clickCall(String? number) {
    widget._businessListDetailsCubit.PostCall(this, id, number);
  }

  createReview(AddReviewRequest request) {
    widget._businessListDetailsCubit.createReview(request, this);
  }
  isfollowing(IsFollower request){
    widget._businessListDetailsCubit.IsFollow(this, request,id);
  }

  bool checkIfLogin() {
    return widget._businessListDetailsCubit.checkIfLogged();
  }

  requestOtp(OtpRequest request) {
    widget._businessListDetailsCubit.requestOtp(this, request);
  }

  verifyOtp(VerifyOtpRequest request) {
    widget._businessListDetailsCubit.verifyOtp(this, request);
  }

  loginFirst() {
    widget._businessListDetailsCubit.emit(RequestOtpState(this));
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && id == "-1") {
      if(args is Map) {
        id = args["id"] as String;
        name = args["name"] as String;
        widget._businessListDetailsCubit.getBusinessDetails(this, id);
        widget._businessListDetailsCubit.ImeiView(this, id);
      }

    }
    return Scaffold(
      appBar: AppBar(title: Text(name!),

      ),

        body: BlocConsumer<BusinessListDetailsCubit, States>(
          bloc: widget._businessListDetailsCubit,
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
        ));
  }
}
