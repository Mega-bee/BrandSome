class LikedByModel {
  int? id;
  String? name;
  String? image;

  LikedByModel({this.id, this.name, this.image});

  LikedByModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }


}
