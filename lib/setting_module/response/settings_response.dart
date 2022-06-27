class GetAccountSetting {
  List<Businesses>? businesses;
  String? name;
  int? reviewCount;
  int? followingCount;
  int? businessesCount;
  String? imageUrl;

  GetAccountSetting(
      {this.businesses,
      this.name,
      this.reviewCount,
      this.followingCount,
      this.businessesCount,
      this.imageUrl});

  GetAccountSetting.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      json['businesses'].forEach((v) {
        businesses!.add(new Businesses.fromJson(v));
      });
    }
    name = json['name'];
    reviewCount = json['reviewCount'];
    followingCount = json['followingCount'];
    businessesCount = json['businessesCount'];
    imageUrl = json['imageUrl'];
  }
}

class Businesses {
  int? id;
  String? name;

  Businesses({this.id, this.name});

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
