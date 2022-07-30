import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/generated/l10n.dart';
import 'package:brandsome/posts_module/ui/screen/createPost.dart';
import 'package:brandsome/posts_module/ui/state/create_post_init.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../repository/create_post_repo.dart';
import '../request/creat_post_request.dart';

@injectable
class CreatePostCubit extends Cubit<States> {
  final CreatePostRepo _createPostRepo;
  final BusinessRepository _businessRepository;

  CreatePostCubit(this._createPostRepo, this._businessRepository)
      : super(LoadingState());

  createPost(CreatePostRequest request, CreatePostScreenState createPostState) {
    emit(LoadingState());
    _createPostRepo.createPost(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              createPost(request, createPostState);
            }));
      } else if (value.code == 201) {
        getIt<GlobalStateManager>().update();
        Navigator.pop(createPostState.context);
        // Navigator.pushNamedAndRemoveUntil(createPostState.context, '/nav_rout', (route) => false);
        Fluttertoast.showToast(
            msg: 'post created Successfully', backgroundColor: Colors.green);
      }
    });
  }

  getUserBusiness(CreatePostScreenState createPostState) {
    emit(LoadingState());
    _businessRepository.getUserBusiness().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: S.current.errorConnection,
            retry: () {
              getUserBusiness(createPostState);
            }));
      } else if (value.code == 200) {
        List<BusinessResponse> bus = [];
        for (var item in value.data.insideData) {
          bus.add(BusinessResponse.fromJson(item));
        }
      emit(CreatePostInit(screenState: createPostState,business: bus));
      }
    });
  }
}
