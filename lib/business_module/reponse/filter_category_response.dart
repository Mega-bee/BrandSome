class FilterSearchModel {
  List<SubCategories>? subCategories;
  int? id;
  String? name;

  FilterSearchModel({this.subCategories, this.id, this.name});

  FilterSearchModel.fromJson(Map<String, dynamic> json) {
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
  }

}

class SubCategories {
  List<Services>? services;
  int? id;
  String? name;

  SubCategories({this.services, this.id, this.name});

  SubCategories.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
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
