// import 'package:brandsome/abstracts/states/error_state.dart';
// import 'package:brandsome/abstracts/states/loading_state.dart';
// import 'package:brandsome/abstracts/states/state.dart';
// import 'package:brandsome/business_module/reponse/get_likes_list_response.dart';
// import 'package:brandsome/business_module/repository/likes_list_repository.dart';
// import 'package:brandsome/business_module/request/add_review_request.dart';
// import 'package:brandsome/business_module/request/create_business_request.dart';
// import 'package:brandsome/business_module/ui/state/business_list_success.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
//
// import '../reponse/get_likes_list_response.dart';
// import '../repository/likes_list_repository.dart';
// import '../ui/state/filter_Success.dart';
//
//
// @injectable
// class HomePageFilterCubit extends Cubit<States> {
//   final FilterRepo _filterRepo;
//
//   HomePageFilterCubit(this._filterRepo) : super(LoadingState());
//
//   getFilter() {
//     _filterRepo.getFilter().then((value) {
//       if(value == null){
//         emit(ErrorState(errorMessage: 'Connection error', retry: getFilter()));
//       }
//       else if (value.code == 200){
//
//         List<FilterSearchModel> filt = [];
//         for (var item in value.data.insideData) {
//           filt.add(FilterSearchModel.fromJson(item));
//         }
//         emit(FilterSuccessScreen(filterSearchModel: filt));
//       }
//     });
//   }
// }