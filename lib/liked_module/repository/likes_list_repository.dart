import 'package:brandsome/abstracts/model/WebServiceResponse.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/module_network/http_client/http_client.dart';
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikedList {
  final ApiClient _apiClient;
//  final AuthService _authService;

  LikedList(this._apiClient);


  Future<WebServiceResponse?> getLikedPosts(String? id) async {
   var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiY2hhcmJlbG0yIiwiVUlEIjoiMzYzZGJmNWItYmY3Ny00YjljLWI4NGMtZGQyN2VmZGNiNTlkIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzNjNkYmY1Yi1iZjc3LTRiOWMtYjg0Yy1kZDI3ZWZkY2I1OWQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwibmJmIjoxNjU1ODEzMzg3LCJleHAiOjE2ODczNDkzODcsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzEwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAifQ.KYf8uQ-9n6jRSIkisfgjb3xOzAs7q6nO8x-RKEbyEKk";
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_LIKED_POSTS + "$id",
     headers: {'Authorization': 'Bearer ' + '$token'},
    );
    if (response == null) return null;
    return response;
  }

}