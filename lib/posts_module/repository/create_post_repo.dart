import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:dio/dio.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

import '../../module_auth/service/auth_service.dart';
import '../request/creat_post_request.dart';

@injectable
class CreatePostRepo {
  final ApiClient _apiClient;
 final AuthService _authService;

  CreatePostRepo(this._apiClient,this._authService);

  Future<WebServiceResponse?> createPost(CreatePostRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_POSTS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}