import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';
import '../request/notification_request.dart';

@injectable
class FireBaseToken {

  final ApiClient _apiClient;
  final AuthService _authService;

  FireBaseToken(this._apiClient, this._authService);


  Future<WebServiceResponse?> FBT(NotificationRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.NOTIFICATION_FBT,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> getNotifications() async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.NOTIFICATION,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


}