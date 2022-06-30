import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/ui/state/add_business_state/add_business_init.dart';
import 'package:brandsome/business_module/ui/state/business_list_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../request/create_business_request.dart';

@injectable
class AddBusinessCubit extends Cubit<States> {
  final BusinessRepository _businessRepository;

  AddBusinessCubit(this._businessRepository) : super(LoadingState());

  addBusiness(CreateBusinessRequest request,) {
    _businessRepository.addBusiness(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          addBusiness(request);
        }));
      }
      else if (value.code == 200){

        }
        // emit(BusinessListSuccess(business: bus));

    });
  }
}