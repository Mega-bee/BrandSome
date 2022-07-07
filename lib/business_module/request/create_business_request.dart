
import 'package:dio/dio.dart';

class AddBusinessRequest {
   String? businessDescription;
   String? businessName;
   String? businessPhoneNumber;
   List<int>  services;
   List<int>  cities;

   MultipartFile? images;

   AddBusinessRequest(
      {
      required this.cities,
     required this.services,
      this.businessDescription,
      this.businessName,
      this.businessPhoneNumber,
      this.images});

  Map<String, dynamic> toJson() {
    return {
      'BusinessDescription': this.businessDescription,
      'BusinessName': this.businessName,
      'BusinessPhoneNumber': this.businessPhoneNumber,
      'Cities': this.cities,
      'Services': this.services,
      'ImageFile': this.images,
    };
  }
}
