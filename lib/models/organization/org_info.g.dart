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
      description: fields[5] as String?,
      id: fields[1] as String?,
      image: fields[0] as String?,
      userRegistrationRequired: fields[6] as bool?,
      name: fields[2] as String?,
      city: fields[8] as String?,
      countryCode: fields[9] as String?,
      line1: fields[10] as String?,
      line2: fields[11] as String?,
      postalCode: fields[12] as String?,
      state: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrgInfo obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.userRegistrationRequired)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.countryCode)
      ..writeByte(10)
      ..write(obj.line1)
      ..writeByte(11)
      ..write(obj.line2)
      ..writeByte(12)
      ..write(obj.postalCode)
      ..writeByte(13)
      ..write(obj.state);
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
