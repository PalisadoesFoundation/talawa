// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 10;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      startAt: fields[3] as String?,
      endAt: fields[4] as String?,
      organization: fields[5] as OrgInfo?,
      creator: fields[6] as User?,
      attachments: (fields[7] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.startAt)
      ..writeByte(4)
      ..write(obj.endAt)
      ..writeByte(5)
      ..write(obj.organization)
      ..writeByte(6)
      ..write(obj.creator)
      ..writeByte(7)
      ..write(obj.attachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttendeeAdapter extends TypeAdapter<Attendee> {
  @override
  final int typeId = 11;

  @override
  Attendee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attendee(
      id: fields[0] as String?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Attendee obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
