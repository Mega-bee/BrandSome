import 'package:dio/dio.dart';

class EditBusinessRequest {
  String? businessDescription;
  int? id;
  String? businessName;
  String? businessPhoneNumber;
  List<int> services;
  List<int> cities;
  MultipartFile? images;


  EditBusinessRequest(
      {required this.services,
      required this.cities,
      this.businessDescription,
      this.businessName,
      this.businessPhoneNumber,
      this.id,
      this.images});

  Map<String, dynamic> toJson() {
    return {
      'Id':id,
      'BusinessDescription': businessDescription,
      'BusinessName': businessName,
      'BusinessPhoneNumber': businessPhoneNumber,
      'Cities': cities,
      'Services': services,
      'ImageFile':images,
    };
  }
}
