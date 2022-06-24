class City {
  int? id;
  String? name;

  City({this.name, this.id});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
  }
}

class BusinessResponse {
  List<City>? city;
  String? description;
  int? viewCount;
  int? postCount;
  int? reviewCount;
  int? followCount;
  String? image;
  int? id;
  String? name;

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
  });

  BusinessResponse.fromJson(Map<String, dynamic> json) {
    description = json['description'];
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
  }
}


