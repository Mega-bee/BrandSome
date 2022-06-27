import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../repository/account_repository.dart';
import '../response/account_response.dart';
import '../response/settings_response.dart';
import '../ui/state/setting_success.dart';
import '../ui/widget/account state/account_success.dart';

@injectable
class AccountCubit extends Cubit<States> {
  final AccountRepository _getAccoun;

  AccountCubit(this._getAccoun) : super(LoadingState());

  getAccount() {
    _getAccoun.getAcc().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: getAccount()));
      }
      else if (value.code == 200){

        Account acc =
        Account.fromJson(value.data.insideData);
        emit(AccountSuccess(getacc:acc));
      }
    });
  }
}