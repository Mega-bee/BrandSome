import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/ErrorSendOtp.dart';
import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/module_auth/ui/state/verify_otp_alert_state.dart';
import 'package:brandsome/setting_module/setting_route.dart';
import 'package:brandsome/setting_module/ui/state/setting_not_logged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../business_module/request/bussines_filter_request.dart';
import '../repository/setting_repository.dart';
import '../response/settings_response.dart';
import '../ui/screen/setting_screen.dart';
import '../ui/state/setting_success.dart';

@injectable
class SettingCubit extends Cubit<States> {
  final SettingRepository _getAccountSetting;
  final AuthRepository _authRepository;
  final AuthService _authService;
   SettingCubit(this._getAccountSetting, this._authService,this._authRepository)
      : super(LoadingState());

  getSetting(SettingsScreenState screenState) {
    if(_authService.isLoggedIn){
      _getAccountSetting.getSet().then((value) {
        if (value == null) {
          emit(ErrorState(
              errorMessage: 'Connection error',
              retry: () {
                getSetting(screenState);
              }));
        } else if (value.code == 200) {
          GetAccountSetting sett =
          GetAccountSetting.fromJson(value.data.insideData);
          emit(SettingSuccess(screenState ,getaccsetting: sett));
        }
      });
    }else{
      emit(SettingNotLogged(screenState));
    }

  }

  void requestOtp(SettingsScreenState screenState, OtpRequest request) {
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

  void verifyOtp(SettingsScreenState screenState,VerifyOtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.verifyOtp(request).then((value) {
      if(value == null){
        emit(ErrorAlertState('Somtheing error'));
      }else if(value.code == 200){

      }else if (value.code != 200){
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number, screenState: screenState,errorMessage: value.errorMessage));
      }
    });
  }
}
