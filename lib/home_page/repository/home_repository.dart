import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';
import '../../module_auth/service/auth_service.dart';
import '../request/is_like.dart';
import '../request/userInterestsRequest.dart';

@injectable
class HomeP {
  final ApiClient _apiClient;
 final AuthService _authService;

  HomeP(this._apiClient,this._authService);


  Future<WebServiceResponse?> getFilter() async {
//    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_FILTER,
//      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getHomePage() async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_HOME_PAGE,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> Like(String?id,LikeRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.LIKE_HOME + "$id",
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> userInterests(setUserInterestsRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.SET_USER_INTERESTS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}