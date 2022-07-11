import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';

class SearchResponse {
  List<BusinessSeaResponse>  business = [];
  List<ServiceModel>  services =[];

  SearchResponse(this.business);

  SearchResponse.fromJson(Map<String, dynamic> json) {
    business = List<BusinessSeaResponse>.from(
      json['businesses'].map(
        (e) => BusinessSeaResponse.fromJson(e),
      ),
    );
    services = List<ServiceModel>.from(
      json['services'].map(
        (e) => ServiceModel.fromJson(e),
      ),
    );
  }
}

class BusinessSeaResponse {
  int? id;
  String? name;
  String? image;
  String? type;
  List<ServiceModel>  service= [];

  BusinessSeaResponse({
    this.id,
    this.name,
    this.image,
    this.type,
   required this.service,
  });

  BusinessSeaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image ='https://brandsome.azurewebsites.net/Images/'+ json['image'];
    json['services'].forEach((v) {
      service.add(ServiceModel.fromJson(v));
    });
  }
}

