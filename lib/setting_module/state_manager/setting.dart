import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../business_module/reponse/business_response.dart';
import '../../business_module/request/bussines_filter_request.dart';
import '../repository/setting_repository.dart';
import '../response/settings_response.dart';
import '../ui/screen/setting_screen.dart';
import '../ui/state/setting_success.dart';

@injectable
class SettingCubit extends Cubit<States> {
  final SettingRepository _getAccountSetting;

  SettingCubit(this._getAccountSetting) : super(LoadingState());

  getSetting() {
    _getAccountSetting.getSet().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          getSetting();
        }));
      }
      else if (value.code == 200){

        GetAccountSetting sett =
        GetAccountSetting.fromJson(value.data.insideData);

        emit(SettingSuccess(getaccsetting:sett));
      }
    });
  }
}