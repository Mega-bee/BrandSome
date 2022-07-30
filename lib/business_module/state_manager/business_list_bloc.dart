import 'dart:convert';

import 'package:brandsome/abstracts/WebUrl.dart';
import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/reponse/search_response.dart';
import 'package:brandsome/business_module/repository/business_repository.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/business_module/ui/state/business_list_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../di/di_config.dart';
import '../../module_auth/repository/auth_repository.dart';
import '../../module_auth/request/otp_request.dart';
import '../../module_auth/service/auth_service.dart';
import '../../module_auth/ui/state/ErrorSendOtp.dart';
import '../../module_auth/ui/state/loading_alert.dart';
import '../../module_auth/ui/state/verify_otp_alert_state.dart';
import '../../utils/global/global_state_manager.dart';
import '../request/business_follow_card_request.dart';

@injectable
class BusinessListCubit extends Cubit<States> {
  final BusinessRepository _businessRepository;
  final AuthService _authService;
  final AuthRepository _authRepository;

  BusinessListCubit(this._businessRepository, this._authService,this._authRepository)
      : super(LoadingState());

  final PublishSubject<SearchResponse> _stateSubject = PublishSubject();

  Stream<SearchResponse> get searchResults => _stateSubject.stream;


  late HubConnection signalRSearch;

  getBusinessList(
      BusinessScreenState screenState, BusinessFilterRequest request) {
    emit(LoadingState());
    _businessRepository.getBusiness(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBusinessList(screenState, request);
            }));
      } else if (value.code == 200) {
        List<BusinessResponse> bus = [];
        for (var item in value.data.insideData) {
          bus.add(BusinessResponse.fromJson(item));
        }
        emit(
          BusinessListSuccess(
            screenState,
            checkIfLogged(),
            business: bus,
          ),
        );
      }
    });
  }

  bool checkIfLogged() {
    return _authService.isLoggedIn;
  }

  void requestOtp(BusinessScreenState screenState, OtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.requestOtp(request).then((value) {
      if (value == null) {
        emit(ErrorAlertState('Somtheing error'));
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number, screenState: screenState));
      } else if (value.code != 200) {
        Navigator.pop(screenState.context);
        emit(ErrorAlertState(value.errorMessage));
      }
    });
  }

  void verifyOtp(
      BusinessScreenState screenState, VerifyOtpRequest request) {
    emit(LoadingAlertState());
    _authRepository.verifyOtp(request).then((value) {
      if (value == null) {
        emit(ErrorAlertState('Somtheing error'));
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        String token = value.data.insideData;
        _authService.setToken(token);
        Fluttertoast.showToast(
            msg: 'Your account created Successfuly',
            backgroundColor: Colors.green);
        getIt<GlobalStateManager>().update();
      } else if (value.code != 200) {
        Navigator.pop(screenState.context);
        emit(VerifyOtpState(
            phoneNumber: request.number,
            screenState: screenState,
            errorMessage: value.errorMessage));
      }
    });
  }

  initConnectFirstTime() async {
    print('iniiit Connect');

    final httpOptions = HttpConnectionOptions(
      transport: HttpTransportType.WebSockets,
      skipNegotiation: true,
    );
    signalRSearch =
        HubConnectionBuilder().withUrl(Urls.HUBS, options: httpOptions).build();
    await signalRSearch.start();
    print("Sreeesssshhshshshhs Update" '${signalRSearch.state}');

    signalRSearch.on('UpdateSearchList', _handleNewMessage);
  }

  searchTerm(String q) async {
    if (signalRSearch.state == HubConnectionState.Disconnected) {
      await signalRSearch.start();
    }
    signalRSearch.invoke('Search', args: <Object>[q]);
  }

  _handleNewMessage(List<Object>? dd) {
    print('after listen result ${dd?.first}');
    print('affter encoddd ${jsonEncode(dd![0])}');
    Map<String, dynamic> valueMap = dd[0] as Map<String, dynamic>;
    print('$valueMap');
    SearchResponse vv = SearchResponse.fromJson(valueMap);
    _stateSubject.add(vv);
  }

  FollowCardState(
    IsFollowCard request,
    String? id,
  ) {
    _businessRepository.FollowCard(id, request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "Error try again later");
      } else if (value.code == 200) {
        Fluttertoast.showToast(msg: "You Are Followed");
        print("follow card");
      }
    });
  }
}
