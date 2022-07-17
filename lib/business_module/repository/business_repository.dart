import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';
import '../request/create_business_request.dart';
import 'package:brandsome/business_module/request/business_follow_card_request.dart';

@injectable
class BusinessRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  BusinessRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getBusiness(BusinessFilterRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_BUSINESS,
      queryParams: request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> addBusiness(CreateBusinessRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_BUSINESS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> FollowCard(String? id,IsFollowCard request) async {
    var token =   _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.FOLLOW_UNFOLLOW+ "$id",
      request.toJson()
      ,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
