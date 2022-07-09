//import 'package:brandsome/abstracts/WebUrl.dart';
//import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
//import 'package:brandsome/module_auth/service/auth_service.dart';
//import 'package:brandsome/module_network/http_client/http_client.dart';
//import 'package:injectable/injectable.dart';
//
//@injectable
//class CategoryRepository {
//  final ApiClient _apiClient;
//
//  final AuthService _authService;
//
//  CategoryRepository(this._apiClient, this._authService);
//
//  Future<WebServiceResponse?> getAllCategory() async {
//    WebServiceResponse? response = await _apiClient.get(
//      Urls.GET_FILTER,
//    );
//    if (response == null) return null;
//    return response;
//  }
//
//  Future<WebServiceResponse?> getLocation() async {
//    WebServiceResponse? response = await _apiClient.get(
//      Urls.GETLOCATION,
//    );
//    if (response == null) return null;
//    return response;
//  }
//}