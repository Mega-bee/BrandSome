import 'package:hive/hive.dart';
part 'hive_category.g.dart';

@HiveType(typeId: 2)
class HiveMainCategory extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  List<HiveSubCategory>? subs;

  HiveMainCategory({
    this.id,
    this.name,
    this.subs,
  });
}

@HiveType(typeId: 3)
class HiveSubCategory extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  List<HiveService>? service;

  HiveSubCategory({
    this.id,
    this.name,
    this.service,
  });
}


@HiveType(typeId: 4)
class HiveService extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  bool? isUserSelected;

  HiveService({
    this.id,
    this.name,
    this.isUserSelected
  });
}

