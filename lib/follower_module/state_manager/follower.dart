import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../business_module/request/bussines_filter_request.dart';
import '../repository/follower_repository.dart';
import '../response/follower_response.dart';
import '../ui/state/followers_sucess.dart';


@injectable
class FollowersCubit extends Cubit<States> {
  final SettingRepository _getAccountFollowers;

  FollowersCubit(this._getAccountFollowers) : super(LoadingState());

  getFoll() {
    _getAccountFollowers.getFollowers().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: getFoll()));
      }
      else if (value.code == 200){
        List<FollowersResp> fol = [];
        for (var item in value.data.insideData) {
          fol.add(FollowersResp.fromJson(item));
        }

        emit(FollowersSuccess(bussfollowers:fol));
      }
    });
  }
}