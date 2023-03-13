// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrgInfoAdapter extends TypeAdapter<OrgInfo> {
  @override
  final int typeId = 2;

  @override
  OrgInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrgInfo(
      admins: (fields[3] as List?)?.cast<User>(),
      members: (fields[4] as List?)?.cast<User>(),
      creatorInfo: fields[7] as User?,
      description: fields[5] as String?,
      id: fields[1] as String?,
      image: fields[0] as String?,
      isPublic: fields[6] as bool?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrgInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.admins)
      ..writeByte(4)
      ..write(obj.members)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isPublic)
      ..writeByte(7)
      ..write(obj.creatorInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrgInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
