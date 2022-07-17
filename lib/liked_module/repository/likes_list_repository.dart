import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikedList {
  final ApiClient _apiClient;
  final AuthService _authService;

  LikedList(this._apiClient, this._authService);


  Future<WebServiceResponse?> getLikedPosts(String? id) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_LIKED_POSTS + "$id",
     headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}