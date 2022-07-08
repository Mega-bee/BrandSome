import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:brandsome/home_page/ui/state/homepage_success.dart';
import 'package:brandsome/liked_module/liked_list_route.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/ErrorSendOtp.dart';
import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/module_auth/ui/state/verify_otp_alert_state.dart';
import 'package:brandsome/navigation_bar/navigator_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../../abstracts/states/error_state.dart';
import '../../business_module/request/create_business_request.dart';
import '../../home_page/repository/business_repository.dart';
import '../ui/screen/createPost.dart';
import '../repository/create_post_repo.dart';
import '../request/bussines_filter_request.dart';

@injectable
class CreatePostCubit extends Cubit<States> {
  final AuthService _authService;
  final AuthRepository _authRepository;
  final CreatePostRepo _createPostRepo;


  CreatePostCubit(this._authService, this._authRepository,this._createPostRepo)
      : super(LoadingState());



  createPost(CreatePostRequest request,CreatePostState createPostState) {
    emit(LoadingState());
    _createPostRepo.createPost(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          createPost(request,createPostState);
        }));
      }
      else if (value.code == 201){
        Navigator.pop(createPostState.context);
        Fluttertoast.showToast(msg: 'Bussiness created Successfully',backgroundColor: Colors.green);
      }
    });
  }
}
