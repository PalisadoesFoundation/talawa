// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      adminFor: (fields[9] as List?)?.cast<OrgInfo>(),
      createdOrganizations: (fields[8] as List?)?.cast<OrgInfo>(),
      email: fields[5] as String?,
      firstName: fields[3] as String?,
      id: fields[2] as String?,
      image: fields[6] as String?,
      joinedOrganizations: (fields[7] as List?)?.cast<OrgInfo>(),
      lastName: fields[4] as String?,
      authToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      membershipRequests: (fields[10] as List?)?.cast<OrgInfo>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.authToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.joinedOrganizations)
      ..writeByte(8)
      ..write(obj.createdOrganizations)
      ..writeByte(9)
      ..write(obj.adminFor)
      ..writeByte(10)
      ..write(obj.membershipRequests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
