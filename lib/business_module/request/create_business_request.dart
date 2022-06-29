import 'dart:html';

import 'package:dio/dio.dart';

class CreateBusinessRequest {
  final String? BusinessDescription;
  final String? BusinessName;
  final String? BusinessPhoneNumber;
  final List<int>? services;
  final List<int>? cities;
  final int? id;
  final MultipartFile? images;

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
