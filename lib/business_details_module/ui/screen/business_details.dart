
import 'package:brandsome/home_page/request/is_like.dart';
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
  const BusnessDetailsScreen(this._businessListDetailsCubit);
  @override
  State<BusnessDetailsScreen> createState() => BusnessDetailsScreenState();
}

class BusnessDetailsScreenState extends State<BusnessDetailsScreen>
    with TickerProviderStateMixin {
  String? id = "-1";
  String? name = "";
  bool? isEvent;

  clickCall(String? number) {
    widget._businessListDetailsCubit.PostCall(this, id, number);
  }

  deleteBusiness(String?id){
    widget._businessListDetailsCubit.deleteBusiness(this, id);
  }

  deletePost(String?id){
    widget._businessListDetailsCubit.deletePost(this, id);
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

  goToLikes(String id) {
    widget._businessListDetailsCubit.getToLikeList(this, id);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  likedPost(LikeRequest request, String id) {
    widget._businessListDetailsCubit.Islike(this, request, id);
  }


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && id == "-1") {
      if(args is Map) {
        id = args["id"] as String;
        name = args["name"] as String;
        isEvent = args["isReview"];
        widget._businessListDetailsCubit.getBusinessDetails(this, id);
        widget._businessListDetailsCubit.ImeiView(this, id);
      }

    }
    ///without map
    // else if (args is int){
    //   id = args as String?;
    //
    // }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            name!,
            style: TextStyle(
                color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
            ),
          ),
        ),
      // appBar: AppBar(title: Text(name!)),
        body: BlocConsumer<BusinessListDetailsCubit, States>(
          bloc: widget._businessListDetailsCubit,
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
}
