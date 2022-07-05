import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../repository/follower_repository.dart';
import '../request/follow_request.dart';
import '../response/follower_response.dart';
import '../ui/screens/follower_list.dart';
import '../ui/state/followers_sucess.dart';


@injectable
class FollowersCubit extends Cubit<States> {
  final FollowerRepository _getAccountFollowers;

  FollowersCubit(this._getAccountFollowers) : super(LoadingState());

  getFoll(FollowersState state) {
    _getAccountFollowers.getFollowers().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          getFoll(state);
        }));
      }
      else if (value.code == 200){
        List<FollowersResp> fol = [];
        for (var item in value.data.insideData) {
          fol.add(FollowersResp.fromJson(item));
        }

        emit(FollowersSuccess(bussfollowers:fol, followers: state));
      }
    });
  }

  void  following(FollowRequest request,String?id,FollowersState state) {
    // emit(LoadingState());
    _getAccountFollowers.follow(id,request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error', retry:(){
          getFoll(state);

        }));
      }
      else if (value.code == 200) {
        if(request.isFollow!){
          Fluttertoast.showToast(msg: "Following",backgroundColor: Colors.black);
        }else{
          Fluttertoast.showToast(msg: "Unfollowing",backgroundColor: Colors.black);
        }
        print('Business followed successfully');


      }
    });
  }
}