class BusinessResponse {
  List<City>? city;
  List<Service>? services;
  String? description;
  int? viewCount;
  int? postCount;
  int? reviewCount;
  int? followCount;
  String? image;
  int? id;
  String? name;
  bool? isFollowed;
  bool  isSelected = false;

  BusinessResponse({
    this.description,
    this.viewCount,
    this.postCount,
    this.reviewCount,
    this.followCount,
    this.image,
    this.id,
    this.name,
    this.city,
    this.services,
    this.isFollowed,
   required this.isSelected,
  });

  BusinessResponse.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    isFollowed = json['isFollowed'];
    viewCount = json['viewCount'];
    postCount = json['postCount'];
    reviewCount = json['reviewCount'];
    followCount = json['followCount'];
    image = json['image'];
    id = json['id'];
    name = json['name'];
    city = List<City>.from(
      json['cities'].map(
        (e) => City.fromJson(e),
      ),
    );
    services = List<Service>.from(
      json['services'].map(
            (e) => Service.fromJson(e),
      ),
    );
  }
}

class City {
  int? id;
  int? businessCityId;
  String? name;
  bool  isSelected  =false;

  City({this.name, this.id ,required this.isSelected , required this.businessCityId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    businessCityId = json["businessCityId"];
  }
}
class Service {
  int? id;
  int? businessServiceId;
  String? name;
  bool  isSelected  =false;

  Service({this.name, this.id ,required this.isSelected , required this.businessServiceId});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    businessServiceId = json["businessServiceId"];
  }
}