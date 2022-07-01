class MainCategoryModel {
  int? id;
  String? name;
  List<SubCategoryModel>  subs = [];
  MainCategoryModel({required this.id, required this.name , required this.subs});

  MainCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['subCategories'] != null) {
      subs = <SubCategoryModel>[];
      json['subCategories'].forEach((v) {
        subs.add(SubCategoryModel.fromJson(v));
      });
    }
  }
}
class SubCategoryModel {
  int? id;
  String? name;
  List<ServiceModel>  services = [];
  SubCategoryModel({required this.id, required this.name , required this.services});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['services'] != null) {
      services = <ServiceModel>[];
      json['services'].forEach((v) {
        services.add(ServiceModel.fromJson(v));
      });
    }
  }
}
class ServiceModel {
  int? id;
  String? name;
  ServiceModel({required this.id, required this.name});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

