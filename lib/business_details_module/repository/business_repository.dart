import 'package:brandsome/abstracts/WebUrl.dart';
import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_details_module/request/add_review_request.dart';

import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/edit_business_request.dart';
import '../request/is_follow.dart';

@injectable
class BusinessRepositoryDetails {
  final ApiClient _apiClient;
  final AuthService _authService;
  final ImeiService _imeiService;

  BusinessRepositoryDetails(this._apiClient, this._authService,this._imeiService);

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
  Future<WebServiceResponse?> IsFollow(String? id,IsFollower request) async {
    var token =   _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.FOLLOW_UNFOLLOW + "$id",
      request.toJson()
      ,
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> IMEI(String? id,) async {
    var token =   _authService.getToken();
    var Imei = await  _imeiService.initPlatformState();

    WebServiceResponse? response = await _apiClient.post(
      Urls.BUSINESS_VIEW + "$id",
      {},
      headers: {'imei':'$Imei','Authorization': 'Bearer ' + '$token'},
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



  Future<WebServiceResponse?> updateBusiness(EditBusinessRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_BUSINESS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> deleteBusiness(String?id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_BUSINESS + "${id}",
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> deletePost(String?id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_POST + "${id}",
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

}
