import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/ui/state/business_list_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../repository/filter_category_response.dart';
import '../ui/state/get_category_success.dart';

@injectable
class GetCategoryListCubit extends Cubit<States> {
  final BusinessRepository _businessRepository;

  GetCategoryListCubit(this._businessRepository) : super(LoadingState());

  getCategoryList() {
    _businessRepository.getAllCategory().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          getCategoryList();
        }));
      }
      else if (value.code == 200){
        List<FilterSearchModel> filt = [];
        for (var item in value.data.insideData) {
          filt.add(FilterSearchModel.fromJson(item));
        }
        emit(GetCategorySuccess(filt));
      }
    });
  }
}