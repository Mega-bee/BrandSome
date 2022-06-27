class FollowersResp {
  String? image;
  String? type;
  List<Services>? services;
  int? id;
  String? name;

  FollowersResp({this.image, this.type, this.services, this.id, this.name});

  FollowersResp.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add( Services.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
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

}

