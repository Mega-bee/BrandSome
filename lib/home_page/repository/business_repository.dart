import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

import '../../business_module/request/create_business_request.dart';
import '../../module_auth/service/auth_service.dart';
import '../request/bussines_filter_request.dart';

@injectable
class FilterRepo {
  final ApiClient _apiClient;
 final AuthService _authService;

  FilterRepo(this._apiClient,this._authService);


  Future<WebServiceResponse?> getFilter() async {
//    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_FILTER,
//      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createBusiness(CreateBusinessRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_POSTS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

}