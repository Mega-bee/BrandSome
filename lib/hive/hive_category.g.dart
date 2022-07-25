// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMainCategoryAdapter extends TypeAdapter<HiveMainCategory> {
  @override
  final int typeId = 2;

  @override
  HiveMainCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMainCategory(
      id: fields[0] as int?,
      name: fields[1] as String?,
      subs: (fields[2] as List?)?.cast<HiveSubCategory>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveMainCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.subs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMainCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSubCategoryAdapter extends TypeAdapter<HiveSubCategory> {
  @override
  final int typeId = 3;

  @override
  HiveSubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSubCategory(
      id: fields[0] as int?,
      name: fields[1] as String?,
      service: (fields[2] as List?)?.cast<HiveService>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveSubCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.service);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSubCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveServiceAdapter extends TypeAdapter<HiveService> {
  @override
  final int typeId = 4;

  @override
  HiveService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveService(
      id: fields[0] as int?,
      name: fields[1] as String?,
      isUserSelected: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveService obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isUserSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
