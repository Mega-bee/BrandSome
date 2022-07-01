import 'package:brandsome/abstracts/WebUrl.dart';
import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_details_module/request/add_review_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessRepositoryDetails {
  final ApiClient _apiClient;
  final AuthService _authService;

  BusinessRepositoryDetails(this._apiClient, this._authService);

  Future<WebServiceResponse?> getBusinessDetails(String? id) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_BUSINESS_DETAILS + "$id",
     headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> PostCall(String? id) async {
    var token =   _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.PHONE_CLICK + "$id",
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> AddReview(AddReviewRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_REVIEW,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
