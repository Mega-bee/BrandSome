import 'package:dio/dio.dart';

class CreatePostRequest {
  int? cityId;
  int? serviceId;

  String? description;
  List<MultipartFile> media;

  CreatePostRequest(
      {this.description, this.cityId, required this.media, this.serviceId});

  Map<String, dynamic> toJson() {
    return {
      "CityId": cityId,
      "Description": description,
      "Media": media,
      "ServiceId": serviceId,
      "Id": 0,
    };
  }
}
