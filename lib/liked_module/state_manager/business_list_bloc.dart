import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../reponse/get_likes_list_response.dart';
import '../repository/business_repository.dart';
import '../ui/state/liked_list_success.dart';


@injectable
class LikedListCubit extends Cubit<States> {
  final LikedList _likedList;

  LikedListCubit(this._likedList) : super(LoadingState());

  getLikesList(String? id) {
    _likedList.getLikedPosts(id).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: getLikesList(id)));
      }
      else if (value.code == 200){

        List<LikedByModel> likes = [];
        for (var item in value.data.insideData) {
          likes.add(LikedByModel.fromJson(item));
        }
        emit(LikedListSuccess(likes));
      }
    });
  }
}