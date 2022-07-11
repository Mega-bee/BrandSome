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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/signalr_client.dart';

@injectable
class BusinessListCubit extends Cubit<States> {
  final BusinessRepository _businessRepository;

  BusinessListCubit(this._businessRepository) : super(LoadingState());

  final PublishSubject<SearchResponse> _stateSubject =
      PublishSubject();
  Stream<SearchResponse> get searchResults => _stateSubject.stream;
  late HubConnection signalRSearch;

  getBusinessList(BusinessScreenState screenState , BusinessFilterRequest request) {
    emit(LoadingState());
    _businessRepository.getBusiness(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBusinessList(screenState,request);
            }));
      } else if (value.code == 200) {
        List<BusinessResponse> bus = [];
        for (var item in value.data.insideData) {
          bus.add(BusinessResponse.fromJson(item));
        }
        emit(BusinessListSuccess(screenState,business: bus));
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
    if(signalRSearch.state == HubConnectionState.Disconnected ) {
    await  signalRSearch.start();
    }
    signalRSearch.invoke('Search', args: <Object>[q]);
  }

  _handleNewMessage(List<Object>? dd) {
    print('after listen result ${dd?.first}');
    print('affter encoddd ${jsonEncode(dd![0])}');
    Map<String, dynamic> valueMap = dd[0] as Map<String, dynamic>;
    print('${valueMap}');
    SearchResponse vv = SearchResponse.fromJson(valueMap);
    _stateSubject.add(vv);
  }
}
