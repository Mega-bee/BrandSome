
import 'package:dio/dio.dart';

class CreateBusinessRequest {
   String? BusinessDescription;
   String? BusinessName;
   String? BusinessPhoneNumber;
   List<int>? services;
   List<int>? cities;
   int? id;
   MultipartFile? images;

  CreateBusinessRequest(
      {this.id,
      this.cities,
      this.services,
      this.BusinessDescription,
      this.BusinessName,
      this.BusinessPhoneNumber,
      this.images});

  Map<String, dynamic> toJson() {
    return {
      'BusinessDescription': this.BusinessDescription,
      'BusinessName': this.BusinessName,
      'BusinessPhoneNumber': this.BusinessPhoneNumber,
      'Cities': this.cities,
      'Services': this.services,
      'Id': this.id,
      'ImageFile': this.images,
    };
  }
}
