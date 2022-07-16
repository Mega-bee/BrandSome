import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/WebUrl.dart';
import '../request/Phone_change.dart';
import '../request/update_profile_request.dart';

@injectable
class AccountRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AccountRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAcc() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GETPROFILE,
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> deleteAcc() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_ACC,
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> UpdateAcc(UpdateProfileRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_PROFILE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> Phonechange(ChangenumberRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.PHONE_CHANGE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

}
