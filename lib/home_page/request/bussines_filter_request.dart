import 'package:dio/dio.dart';

class CreateBusinessRequest {

int?cityId;
int?id;
int?serviceId;
String?description;
MultipartFile?media;

  CreateBusinessRequest({this.id,this.description,this.cityId,this.media,this.serviceId});

  Map<String, dynamic> toJson() {
    return {
      "CityId":this.cityId,
      "Description": this.description,
      "Media":this.media,
      "ServiceId":this.serviceId,
      "Id":this.id,
    };
  }

}