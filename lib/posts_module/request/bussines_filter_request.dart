import 'package:dio/dio.dart';

class CreatePostRequest {

int?cityId;
// int?id;
int?serviceId;
String?description;
List <MultipartFile>media;

  CreatePostRequest({this.description,this.cityId,required this.media,this.serviceId});

  Map<String, dynamic> toJson() {
    return {
      "CityId":this.cityId,
      "Description": this.description,
      "Media":this.media,
      "ServiceId":this.serviceId,
      // "Id":this.id,
    };
  }

}