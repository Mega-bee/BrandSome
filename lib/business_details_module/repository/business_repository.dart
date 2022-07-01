import 'package:brandsome/abstracts/WebUrl.dart';
import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_details_module/request/add_review_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessRepositoryDetails {
  final ApiClient _apiClient;
//  final AuthService _authService;

  BusinessRepositoryDetails(this._apiClient);

  Future<WebServiceResponse?> getBusinessDetails(String? id) async {
    var token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQ2hyaXN0aWFuX3pha2hvdXIiLCJVSUQiOiJmM2RkMmU1OS0zNmRmLTRmNWItODJiNC0yNDI4MzljYjkxNTYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImYzZGQyZTU5LTM2ZGYtNGY1Yi04MmI0LTI0MjgzOWNiOTE1NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2NTYzMTk3NDEsImV4cCI6MTY4Nzg1NTc0MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxMCJ9.m8Wst-HkqSbxDFE3A0-jETm34QF4c845Gq_whXvVGG8";
//    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_BUSINESS_DETAILS + "$id",
     headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> PostCall(String? id) async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQ2hyaXN0aWFuX3pha2hvdXIiLCJVSUQiOiJmM2RkMmU1OS0zNmRmLTRmNWItODJiNC0yNDI4MzljYjkxNTYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImYzZGQyZTU5LTM2ZGYtNGY1Yi04MmI0LTI0MjgzOWNiOTE1NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2NTYzMTk3NDEsImV4cCI6MTY4Nzg1NTc0MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxMCJ9.m8Wst-HkqSbxDFE3A0-jETm34QF4c845Gq_whXvVGG8';
    WebServiceResponse? response = await _apiClient.post(
      Urls.PHONE_CLICK + "$id",
      {},
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> AddReview(AddReviewRequest request) async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQ2hyaXN0aWFuX3pha2hvdXIiLCJVSUQiOiJmM2RkMmU1OS0zNmRmLTRmNWItODJiNC0yNDI4MzljYjkxNTYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImYzZGQyZTU5LTM2ZGYtNGY1Yi04MmI0LTI0MjgzOWNiOTE1NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2NTYzMTk3NDEsImV4cCI6MTY4Nzg1NTc0MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxMCJ9.m8Wst-HkqSbxDFE3A0-jETm34QF4c845Gq_whXvVGG8';
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_REVIEW,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
