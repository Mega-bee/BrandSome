import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/setting_module/repository/account_repository.dart';
import 'package:brandsome/setting_module/ui/screen/account_info_screen.dart';
import 'package:brandsome/setting_module/ui/state/account_state/account_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../request/update_profile_request.dart';
import '../response/account_response.dart';

@injectable
class AccountCubit extends Cubit<States> {
  final AccountRepository _getAccoun;

  AccountCubit(this._getAccoun) : super(LoadingState());

  getAccount(AccountInfoScreenState screenState) {
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
      }
    });
  }
}
