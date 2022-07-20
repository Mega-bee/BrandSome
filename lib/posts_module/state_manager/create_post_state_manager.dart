import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/posts_module/ui/screen/createPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../repository/create_post_repo.dart';
import '../request/creat_post_request.dart';

@injectable
class CreatePostCubit extends Cubit<States> {
  final AuthService _authService;
  final AuthRepository _authRepository;
  final CreatePostRepo _createPostRepo;


  CreatePostCubit(this._authService, this._authRepository,this._createPostRepo)
      : super(LoadingState());



  createPost(CreatePostRequest request,CreatePostScreenState createPostState) {
    emit(LoadingState());
    _createPostRepo.createPost(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          createPost(request,createPostState);
        }));
      }
      else if (value.code == 201){
        Navigator.pop(createPostState.context);
        // Navigator.pushNamedAndRemoveUntil(createPostState.context, '/nav_rout', (route) => false);
        Fluttertoast.showToast(msg: 'post created Successfully',backgroundColor: Colors.green);
      }
    });
  }
}
