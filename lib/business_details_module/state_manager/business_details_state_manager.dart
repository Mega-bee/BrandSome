import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/ErrorSendOtp.dart';
import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
import 'package:brandsome/module_auth/ui/state/verify_otp_alert_state.dart';
import 'package:brandsome/navigation_bar/navigator_routes.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';
import '../reponse/business_response.dart';
import '../repository/business_repository.dart';
import '../request/add_review_request.dart';
import '../request/edit_business_request.dart';
import '../request/is_follow.dart';
import '../request/is_follow.dart';
import '../request/is_follow.dart';
import '../ui/screen/business_details.dart';
import '../ui/screen/update_business.dart';
import '../ui/state/BusinessDetailsSuccess.dart';

@injectable
class BusinessListDetailsCubit extends Cubit<States> {
  final BusinessRepositoryDetails _businessRepositoryDetails;
  final AuthRepository _authRepository;
  final AuthService _authService;

  BusinessListDetailsCubit(this._businessRepositoryDetails, this._authRepository, this._authService) : super(LoadingState());

  getBusinessDetails(BusnessDetailsScreenState screenstate,String? id) {
    emit(LoadingState());
    _businessRepositoryDetails.getBusinessDetails(id).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry:(){
          getBusinessDetails(screenstate,id);
        }
        ));
      }
      else if (value.code == 200){
        BusinessInfoResponse businessInfoModel = BusinessInfoResponse.fromJson(value.data.insideData);
        emit(BusinessDetailsSuccess(screenstate,businessInfoModel,checkIfLogged(),));
      }
    });
  }

void ImeiView(BusnessDetailsScreenState screenstate,String? id){
    _businessRepositoryDetails.IMEI(id).then((value) {
      if (value!.code == 200){
        print("Imeiiiii seuccess");
      }
    }
    );
}

  PostCall(BusnessDetailsScreenState screenstate,String? id,String? number) {
    _businessRepositoryDetails.PostCall(id).then((value) {
       if (value!.code == 200){

         launchUrl("tel://${number}.");
      }
    });

  }
  IsFollow(BusnessDetailsScreenState screenState,IsFollower request,String? id ) {
    _businessRepositoryDetails.IsFollow(id,request).then((value) {
      if (value!.code == 200){

        Fluttertoast.showToast(msg: "You Are Followed");
        print("is foloowowowowowowowowowowowowowowoowowow");

      }
    });

  }


  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


void  createReview(AddReviewRequest request,BusnessDetailsScreenState screenState) {
    emit(LoadingState());
    _businessRepositoryDetails.AddReview(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error', retry:(){
          getBusinessDetails(screenState,request.Bussinessid);

        }));
      }
      else if (value.code == 200) {
        print('review add successfully');
        getBusinessDetails(screenState,request.Bussinessid);
      }
    });
  }

  bool checkIfLogged(){
   return _authService.isLoggedIn;
  }

  void requestOtp(BusnessDetailsScreenState screenState, OtpRequest request) {
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

  void verifyOtp(BusnessDetailsScreenState screenState,VerifyOtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.verifyOtp(request).then((value) {
      if(value == null){
        emit(ErrorAlertState('Somtheing error'));
      }else if(value.code == 200){
        Navigator.pop(screenState.context);
        String token =  value.data.insideData;
        _authService.setToken(token);
        Fluttertoast.showToast(msg: 'Your account created Successfuly',backgroundColor: Colors.green);
        getIt<GlobalStateManager>().update();
      }else if (value.code != 200){
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number, screenState: screenState,errorMessage: value.errorMessage));
      }
    });
  }

  void  editBusiness(EditBusinessRequest request,UpdateBusinessState screenstate) {
    // emit(LoadingState());
    _businessRepositoryDetails.updateBusiness(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "Error try again");
      }
      else if (value.code == 200) {
        print('review add successfully');
       Navigator.pop(screenstate.context);
      }
    });
  }

  void  deleteBusiness(BusnessDetailsScreenState screenstate,String?id) {
    emit(LoadingState());
    _businessRepositoryDetails.deleteBusiness(id).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "Error try again");
      }
      else if (value.code == 200) {
        print('Business deleted successfully');
        Fluttertoast.showToast(msg:'Business deleted successfully');
        Navigator.pop(screenstate.context);
      }
    });
  }

  void  deletePost(BusnessDetailsScreenState screenstate,String?id) {
    emit(LoadingState());
    _businessRepositoryDetails.deletePost(id).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "Error try again");
      }
      else if (value.code == 200) {
        print('Post deleted successfully');
        Fluttertoast.showToast(msg:'Post deleted successfully');
        Navigator.pop(screenstate.context);
      }
    });
  }
}


