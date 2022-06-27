import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessRepositoryDetails {
  final ApiClient _apiClient;
//  final AuthService _authService;

  BusinessRepositoryDetails(this._apiClient);


  Future<WebServiceResponse?> getBusinessDetails(String? id) async {
//    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_BUSINESS_DETAILS + "$id",
//      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

}