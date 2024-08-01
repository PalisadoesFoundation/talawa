// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_user_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedUserActionAdapter extends TypeAdapter<CachedUserAction> {
  @override
  final int typeId = 3;

  @override
  CachedUserAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedUserAction(
      id: fields[0] as String,
      operation: fields[1] as String,
      variables: (fields[2] as Map?)?.cast<String, dynamic>(),
      timeStamp: fields[3] as DateTime,
      status: fields[4] as CachedUserActionStatus,
      metaData: (fields[5] as Map?)?.cast<String, dynamic>(),
      operationType: fields[6] as CachedOperationType,
      expiry: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedUserAction obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.operation)
      ..writeByte(2)
      ..write(obj.variables)
      ..writeByte(3)
      ..write(obj.timeStamp)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.metaData)
      ..writeByte(6)
      ..write(obj.operationType)
      ..writeByte(7)
      ..write(obj.expiry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedUserActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
