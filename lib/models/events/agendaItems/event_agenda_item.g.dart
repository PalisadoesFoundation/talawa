// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_agenda_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAgendaItemAdapter extends TypeAdapter<EventAgendaItem> {
  @override
  final int typeId = 13;

  @override
  EventAgendaItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventAgendaItem(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      duration: fields[3] as String?,
      key: fields[4] as String?,
      type: fields[7] as String?,
      createdAt: fields[10] as DateTime?,
      updatedAt: fields[11] as DateTime?,
      attachments: (fields[5] as List?)?.cast<String>(),
      urls: (fields[6] as List?)?.cast<String>(),
      categories: (fields[8] as List?)?.cast<AgendaCategory>(),
      sequence: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EventAgendaItem obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.key)
      ..writeByte(5)
      ..write(obj.attachments)
      ..writeByte(6)
      ..write(obj.urls)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.categories)
      ..writeByte(9)
      ..write(obj.sequence)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAgendaItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
