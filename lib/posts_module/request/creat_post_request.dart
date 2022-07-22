import 'package:dio/dio.dart';

class CreatePostRequest {
  int? cityId;
  int? serviceId;

  String? description;
  List<MultipartFile> media;

  CreatePostRequest(
      {this.description, this.cityId, required this.media, this.serviceId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data =  Map<String, dynamic>();

    data["CityId"]= this.cityId;
    data["Description"] = this.description;
    data["ServiceId"]= this.serviceId;
    data[ "Id"] = 0;
    data['Media'] = [];
    if (this.media != null && this.media is List) {
    for(int i =0 ; i < media.length ; i++){
    data['Media'].insert(i,media[i]);
    }
  }
    return data;
}
}
