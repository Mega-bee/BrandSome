import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/business_module/ui/screen/add_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../request/create_business_request.dart';

@injectable
class AddBusinessCubit extends Cubit<States> {
  final BusinessRepository _businessRepository;

  AddBusinessCubit(this._businessRepository) : super(LoadingState());

  addBusiness(AddBusinessRequest request,AddBusinessState businessState) {
    emit(LoadingState());
    _businessRepository.addBusiness(request).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          addBusiness(request,businessState);
        }));
      }
      else if (value.code == 200){
        Navigator.pop(businessState.context);
        Fluttertoast.showToast(msg: 'Bussiness add Successfully',backgroundColor: Colors.green);
      }
    });
  }
}