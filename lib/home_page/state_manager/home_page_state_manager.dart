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
import '../repository/business_repository.dart';
import '../request/bussines_filter_request.dart';
import '../ui/screen/createPost.dart';

@injectable
class HomePageCubit extends Cubit<States> {
  final AuthService _authService;
  final AuthRepository _authRepository;
  final FilterRepo _filterRepo;


  HomePageCubit(this._authService, this._authRepository,this._filterRepo)
      : super(LoadingState());

  getToLikeList(HomePageScreenState screenState) {
    if (_authService.isLoggedIn) {
      Navigator.pushNamed(
        screenState.context,
        LikedListRoute.LIKED_LIST,
        arguments: "2",
      );
    } else {
      emit(RequestOtpState(screenState));
    }
  }

  void requestOtp(HomePageScreenState screenState, OtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.requestOtp(request).then((value) {
      if (value == null) {
        emit(ErrorAlertState('Somtheing error'));
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number, screenState: screenState));
      } else if (value.code != 200) {
        Navigator.pop(screenState.context);
        emit(ErrorAlertState(value.errorMessage));
      }
    });
  }

  void verifyOtp(HomePageScreenState screenState,VerifyOtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.verifyOtp(request).then((value) {
      if(value == null){
        emit(ErrorAlertState('Somtheing error'));
      }else if(value.code == 200){
        Navigator.pop(screenState.context);
        String token =  value.data.insideData;
        _authService.setToken(token);
        Navigator.pushNamedAndRemoveUntil(screenState.context, NavRoutes.nav_rout, (route) => false);
      }else if (value.code != 200){
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number, screenState: screenState,errorMessage: value.errorMessage));
      }
    });
  }

  createPost(CreateBusinessRequest request,CreatePostState createPostState) {
    emit(LoadingState());
    _filterRepo.createBusiness(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          createPost(request,createPostState);
        }));
      }
      else if (value.code == 200){
        Navigator.pop(createPostState.context);
        Fluttertoast.showToast(msg: 'Bussiness created Successfully',backgroundColor: Colors.green);
      }
    });
  }
}
