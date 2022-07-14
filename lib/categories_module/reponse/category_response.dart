class MainCategoryModel {
  int? id;
  String? name;
  bool? isSelected = false;
  List<SubCategoryModel>  subs = [];
  MainCategoryModel({required this.id, required this.name , required this.subs ,this.isSelected});

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
  bool? isSelected = false;
  List<ServiceModel>  services = [];
  SubCategoryModel({required this.id, required this.name , required this.services,this.isSelected});

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
  String? image;
  String? category;
  bool  isSelected = false;
  ServiceModel({
    this.category,
    required this.id, required this.name ,this.image ,required this.isSelected});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    category = json['category'];
  }
}

