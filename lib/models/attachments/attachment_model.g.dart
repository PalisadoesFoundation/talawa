// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttachmentModelAdapter extends TypeAdapter<AttachmentModel> {
  @override
  final int typeId = 8;

  @override
  AttachmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttachmentModel(
      name: fields[1] as String?,
      fileHash: fields[2] as String?,
      mimetype: fields[3] as String?,
      objectName: fields[4] as String?,
      url: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AttachmentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fileHash)
      ..writeByte(3)
      ..write(obj.mimetype)
      ..writeByte(4)
      ..write(obj.objectName)
      ..writeByte(5)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
