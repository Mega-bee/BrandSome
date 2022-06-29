import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/ui/state/business_list_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global_variable.dart';
import '../reponse/business_response.dart';
import '../repository/business_repository.dart';
import '../request/add_review_request.dart';
import '../ui/screen/business_details.dart';
import '../ui/state/BusinessDetailsSuccess.dart';

@injectable
class BusinessListDetailsCubit extends Cubit<States> {
  final BusinessRepositoryDetails _businessRepositoryDetails;

  BusinessListDetailsCubit(this._businessRepositoryDetails) : super(LoadingState());

  getBusinessDetails(BusnessDetailsScreenState screenstate,String? id) {
    _businessRepositoryDetails.getBusinessDetails(id).then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: getBusinessDetails(screenstate,id)));
      }
      else if (value.code == 200){

        BusinessInfoResponse businessInfoModel = BusinessInfoResponse.fromJson(value.data.insideData);
        emit(BusinessDetailsSuccess(screenstate,businessInfoModel));
      }
    });
  }
  PostCall(BusnessDetailsScreenState screenstate,String? id,String? number) {
    _businessRepositoryDetails.PostCall(id).then((value) {
       if (value!.code == 200){
         launchUrl("tel://${number}.");
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
  CreateReview(AddReviewRequest request,BusnessDetailsScreenState screenState) {
    _businessRepositoryDetails.AddReview(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error', retry: CreateReview(request,screenState)));
      }
      else if (value!.code == 200) {
        Navigator.pop(screenState.context);
      }
    });
  }
}


