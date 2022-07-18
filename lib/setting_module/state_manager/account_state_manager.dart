import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/setting_module/repository/account_repository.dart';
import 'package:brandsome/setting_module/ui/screen/account_info_screen.dart';
import 'package:brandsome/setting_module/ui/state/account_state/account_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../module_auth/request/otp_request.dart';
import '../../module_auth/ui/state/ErrorSendOtp.dart';
import '../../module_auth/ui/state/verify_otp_alert_state.dart';
import '../../utils/global/global_state_manager.dart';
import '../request/Phone_change.dart';
import '../request/update_profile_request.dart';
import '../response/account_response.dart';

@injectable
class AccountCubit extends Cubit<States> {
  final AccountRepository _getAccoun;
  final AuthService _authService;
  final AuthRepository _authRepository;

  AccountCubit(this._getAccoun, this._authService, this._authRepository)
      : super(LoadingState());

  getAccount(AccountInfoScreenState screenState) {
    if (_authService.isLoggedIn) {
      emit(LoadingState());
      _getAccoun.getAcc().then((value) {
        if (value == null) {
          emit(ErrorState(
              errorMessage: 'Connection error',
              retry: () {
                getAccount(screenState);
              }));
        } else if (value.code == 200) {
          AccountResponse accountModel =
              AccountResponse.fromJson(value.data.insideData);
          emit(AccountSuccess(screenState, accountModel: accountModel));
        }
      });
    } else {
      print('hehehe');
      emit(RequestOtpState(screenState));
    }
  }

  updateProfile(
    AccountInfoScreenState screenState,
    UpdateProfileRequest request,
  ) {
    emit(LoadingState());
    _getAccoun.UpdateAcc(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'errrorr', retry: () {}));
      } else if (value.code == 200) {
        getAccount(screenState);
        getIt<GlobalStateManager>().update();
      }
    });
  }

  changeMobilenum(
    AccountInfoScreenState screenState,
    ChangenumberRequest request,
  ) {
    emit(LoadingWaitingState("Waiting..."));
    _getAccoun.Phonechange(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'errrorr', retry: () {}));
      } else if (value.code == 200) {
        emit(
          VerifyOtpState(
              phoneNumber: request.PhoneNumber,
              screenState: screenState,
              errorMessage: ""),
        );
      }
    });
  }

  void verifyOtp(AccountInfoScreenState screenState, VerifyOtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.verifyOtp(request).then((value) {
      if (value == null) {
        emit(ErrorAlertState('Somtheing error'));
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        screenState.newNumber.text = request.number!;
        screenState.refresh();
        // String token = value.data.insideData;
        // _authService.setToken(token);

      } else if (value.code != 200) {
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number,
            screenState: screenState,
            errorMessage: value.errorMessage));
      }
    });
  }

  deleteAccount(
    AccountInfoScreenState screenState,
  ) {
    emit(LoadingWaitingState("Waiting To Delete Your Account"));
    _getAccoun.deleteAcc().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'error',
            retry: () {
              Fluttertoast.showToast(
                  msg: 'Error deleting account', backgroundColor: Colors.green);
            }));
      } else if (value.code == 200) {
        _authService.clearToken().then((value) {
          getIt<GlobalStateManager>().update();
          Navigator.pop(screenState.context);
        });
      }
    });
  }
}
