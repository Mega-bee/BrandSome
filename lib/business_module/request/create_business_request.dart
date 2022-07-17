
import 'package:dio/dio.dart';

class CreateBusinessRequest {
   String? businessDescription;
   String? businessName;
   String? businessPhoneNumber;
   List<int>  services;
   List<int>  cities;

   MultipartFile? images;

  CreateBusinessRequest(
      {
      required this.cities,
     required this.services,
      this.businessDescription,
      this.businessName,
      this.businessPhoneNumber,
      this.images});

  Map<String, dynamic> toJson() {
    return {
      'BusinessDescription': businessDescription,
      'BusinessName': businessName,
      'BusinessPhoneNumber': businessPhoneNumber,
      'Cities': cities,
      'Services': services,
      'ImageFile': images,
    };
  }
}
