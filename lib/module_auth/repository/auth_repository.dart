import 'package:brandsome/abstracts/WebUrl.dart';
import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);


  Future<WebServiceResponse?> requestOtp( OtpRequest request) async {
    WebServiceResponse? response = await _apiClient.post(
      Urls.REQUEST_OTP,
      request.toJson()
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> verifyOtp( VerifyOtpRequest request) async {
    WebServiceResponse? response = await _apiClient.post(
        Urls.VERIFY_OTP,
        request.toJson()
    );
    if (response == null) return null;
    return response;
  }
}