import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/home_page/response/home_page.dart';

class BusinessInfoResponse {
  String? type;
  String? phoneNumber;

  List<Post>? posts;
  List<Reviews>? reviews;
  bool? isUserBusiness;

  List<Service>? services;
  List<City>? cities;
  String? description;
  int? viewCount;
  int? postCount;
  int? reviewCount;
  int? followCount;
  String? image;
  int? id;
  String? name;
  bool? isFollow;

  BusinessInfoResponse(
      {this.type,
        this.phoneNumber,
        this.posts,
        this.reviews,
        this.isUserBusiness,
        this.services,
        this.cities,
        this.description,
        this.viewCount,
        this.postCount,
        this.reviewCount,
        this.followCount,
        this.image,
        this.id,
        this.name,
        this.isFollow ,
      });

  BusinessInfoResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    if (json['posts'] != null) {
      posts = <Post>[];
      json['posts'].forEach((v) {
        posts!.add(Post.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    isUserBusiness = json['isUserBusiness'];
    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(City.fromJson(v));
      });
    }
    description = json['description'];
    viewCount = json['viewCount'];
    postCount = json['postCount'];
    reviewCount = json['reviewCount'];
    followCount = json['followCount'];
    image = json['image'];
    id = json['id'];
    name = json['name'];
    isFollow = json['isFollowed'];
  }
}


class Reviews {
  int? id;
  String? name;
  String? image;
  String? description;
  DateTime? createdDate;

  Reviews({this.name, this.id, this.image, this.createdDate});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    image = json["image"];
    description = json["description"];
    createdDate = DateTime.parse(json['createdDate']);
  }
}

