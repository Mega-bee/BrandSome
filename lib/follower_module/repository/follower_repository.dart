import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

import '../request/follow_request.dart';

@injectable
class FollowerRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  FollowerRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getFollowers() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GETFOLLOWEDBUSINESSES,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> follow(String?id,FollowRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.FOLLOW_UNFOLLOW + "$id",
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
