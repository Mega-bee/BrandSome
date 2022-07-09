import 'package:hive/hive.dart';
part 'hive_city.g.dart';

@HiveType(typeId: 1)
class HiveCity extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;
  HiveCity({
    this.id,
    this.name,
  });
}