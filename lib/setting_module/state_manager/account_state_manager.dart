import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/setting_module/repository/account_repository.dart';
import 'package:brandsome/setting_module/ui/screen/account_info_screen.dart';
import 'package:brandsome/setting_module/ui/state/account_state/account_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../utils/global/global_state_manager.dart';
import '../request/update_profile_request.dart';
import '../response/account_response.dart';

@injectable
class AccountCubit extends Cubit<States> {
  final AccountRepository _getAccoun;
  final AuthService _authService;

  AccountCubit(this._getAccoun, this._authService) : super(LoadingState());

  getAccount(AccountInfoScreenState screenState) {
   if(_authService.isLoggedIn) {
    emit(LoadingState());
    _getAccoun.getAcc().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getAccount(screenState);
            }));
      } else if (value.code == 200) {
        screenState.accountModel =
            AccountResponse.fromJson(value.data.insideData);
        emit(AccountSuccess(accountModel: screenState.accountModel));
      }
    });
    }else{
     print('hhhhh');
     emit(RequestOtpState(screenState));
   }

  }

  updateProfile(
    AccountInfoScreenState screenState,
    UpdateProfileRequest request,
  ) {
    emit(LoadingState());
    _getAccoun.UpdateAcc(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'errrorr', retry: (){}));
      }
   else if (value.code == 200) {
        getAccount(screenState);
        getIt<GlobalStateManager>().update();
      }
    });
  }
}
