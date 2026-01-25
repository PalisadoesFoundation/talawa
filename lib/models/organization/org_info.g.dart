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
<<<<<<< HEAD
      admins: (fields[3] as List?)?.cast<User>(),
      members: (fields[4] as List?)?.cast<User>(),
=======
>>>>>>> upstream/develop
      description: fields[5] as String?,
      id: fields[1] as String?,
      image: fields[0] as String?,
      userRegistrationRequired: fields[6] as bool?,
      name: fields[2] as String?,
      city: fields[7] as String?,
      countryCode: fields[8] as String?,
      line1: fields[9] as String?,
      line2: fields[10] as String?,
      postalCode: fields[11] as String?,
      state: fields[12] as String?,
<<<<<<< HEAD
=======
      adminsCount: fields[13] as int?,
      membersCount: fields[14] as int?,
      members: (fields[15] as List?)?.cast<User>(),
      admins: (fields[16] as List?)?.cast<User>(),
>>>>>>> upstream/develop
    );
  }

  @override
  void write(BinaryWriter writer, OrgInfo obj) {
    writer
<<<<<<< HEAD
      ..writeByte(13)
=======
      ..writeByte(15)
>>>>>>> upstream/develop
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
<<<<<<< HEAD
      ..writeByte(3)
      ..write(obj.admins)
      ..writeByte(4)
      ..write(obj.members)
=======
>>>>>>> upstream/develop
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.userRegistrationRequired)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.countryCode)
      ..writeByte(9)
      ..write(obj.line1)
      ..writeByte(10)
      ..write(obj.line2)
      ..writeByte(11)
      ..write(obj.postalCode)
      ..writeByte(12)
<<<<<<< HEAD
      ..write(obj.state);
=======
      ..write(obj.state)
      ..writeByte(13)
      ..write(obj.adminsCount)
      ..writeByte(14)
      ..write(obj.membersCount)
      ..writeByte(15)
      ..write(obj.members)
      ..writeByte(16)
      ..write(obj.admins);
>>>>>>> upstream/develop
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
