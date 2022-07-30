//class FilterSearchModel {
//  List<SubCategories>? subCategories;
//  int? id;
//  String? name;
//
//  FilterSearchModel({this.subCategories, this.id, this.name});
//
//  FilterSearchModel.fromJson(Map<String, dynamic> json) {
//    if (json['subCategories'] != null) {
//      subCategories = <SubCategories>[];
//      json['subCategories'].forEach((v) {
//        subCategories!.add(SubCategories.fromJson(v));
//      });
//    }
//    id = json['id'];
//    name = json['name'];
//  }
//
//}
//
//class SubCategories {
//  List<ServicesCat>? services;
//  int? id;
//  String? name;
//
//  SubCategories({this.services, this.id, this.name});
//
//  SubCategories.fromJson(Map<String, dynamic> json) {
//    if (json['services'] != null) {
//      services = <ServicesCat>[];
//      json['services'].forEach((v) {
//        services!.add(ServicesCat.fromJson(v));
//      });
//    }
//    id = json['id'];
//    name = json['name'];
//  }
//
//}
//
//class ServicesCat {
//  int? id;
//  String? name;
//
//  ServicesCat({this.id, this.name});
//
//  ServicesCat.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    name = json['name'];
//  }
//
//}
