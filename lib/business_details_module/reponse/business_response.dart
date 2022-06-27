class BusinessInfoResponse {
  String? type;
  String? phoneNumber;

  List<Posts>? posts;
  List<Reviews>? reviews;
  bool? isUserBusiness;

  List<Services>? services;
  List<City>? cities;
  String? description;
  int? viewCount;
  int? postCount;
  int? reviewCount;
  int? followCount;
  String? image;
  int? id;
  String? name;

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
        this.name});

  BusinessInfoResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    isUserBusiness = json['isUserBusiness'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(new City.fromJson(v));
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
  }
}

class City {
  int? id;
  String? name;

  City({this.name, this.id});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
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

class Posts {
  int? id;
  String? name;
  String? profileImage;
  List<PostMedia>? postMedia;
  String? description;
  int? likeCount;
  bool? isLiked;
  String? city;
  String? type;

  Posts(
      {this.id,
        this.name,
        this.profileImage,
        this.postMedia,
        this.description,
        this.likeCount,
        this.isLiked,
        this.city,
        this.type});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['postMedia'] != null) {
      postMedia = <PostMedia>[];
      json['postMedia'].forEach((v) {
        postMedia!.add(new PostMedia.fromJson(v));
      });
    }
    description = json['description'];
    likeCount = json['likeCount'];
    isLiked = json['isLiked'];
    city = json['city'];
    type = json['type'];
    profileImage = json['profileImage'];

  }
}

class PostMedia {
  int? id;
  String? url;
  int? mediaTypeId;
  String? mediaTypeName;

  PostMedia({this.id, this.url, this.mediaTypeId, this.mediaTypeName});

  PostMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    mediaTypeId = json['mediaTypeId'];
    mediaTypeName = json['mediaTypeName'];
  }
}

class Services {
  int? id;
  String? name;

  Services({this.id, this.name});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
