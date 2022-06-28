import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessRepository {
  final ApiClient _apiClient;
//  final AuthService _authService;

  BusinessRepository(this._apiClient);


  Future<WebServiceResponse?> getBusiness(BusinessFilterRequest request) async {
//    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_BUSINESS,queryParams:request.toJson()
//      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getAllCategory() async {
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_FILTER,
    );
    if (response == null) return null;
    return response;
  }

}