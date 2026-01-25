// GENERATED CODE - DO NOT MODIFY BY HAND

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
<<<<<<< HEAD
      title: fields[1] as String?,
=======
      name: fields[1] as String?,
>>>>>>> upstream/develop
      description: fields[2] as String?,
      attendees: (fields[16] as List?)?.cast<Attendee>(),
      location: fields[3] as String?,
      recurring: fields[4] as bool?,
      allDay: fields[5] as bool?,
<<<<<<< HEAD
      startDate: fields[6] as String?,
      endDate: fields[7] as String?,
      startTime: fields[8] as String?,
      endTime: fields[9] as String?,
=======
      startAt: fields[6] as DateTime?,
      endAt: fields[7] as DateTime?,
>>>>>>> upstream/develop
      isPublic: fields[10] as bool?,
      isRegistered: fields[11] as bool?,
      isRegisterable: fields[12] as bool?,
      creator: fields[13] as User?,
      organization: fields[14] as OrgInfo?,
      admins: (fields[15] as List?)?.cast<User>(),
<<<<<<< HEAD
=======
      agendaItems: (fields[17] as List?)?.cast<EventAgendaItem>(),
      progressLabel: fields[20] as String?,
      sequenceNumber: fields[21] as int?,
      totalCount: fields[22] as int?,
      baseEvent: fields[19] as Event?,
      isRecurringEventTemplate: fields[18] as bool?,
      venues: (fields[23] as List?)?.cast<Venue>(),
      recurrenceRule: fields[24] as RecurrenceRule?,
>>>>>>> upstream/develop
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
<<<<<<< HEAD
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
=======
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
>>>>>>> upstream/develop
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.recurring)
      ..writeByte(5)
      ..write(obj.allDay)
      ..writeByte(6)
<<<<<<< HEAD
      ..write(obj.startDate)
      ..writeByte(7)
      ..write(obj.endDate)
      ..writeByte(8)
      ..write(obj.startTime)
      ..writeByte(9)
      ..write(obj.endTime)
=======
      ..write(obj.startAt)
      ..writeByte(7)
      ..write(obj.endAt)
>>>>>>> upstream/develop
      ..writeByte(10)
      ..write(obj.isPublic)
      ..writeByte(11)
      ..write(obj.isRegistered)
      ..writeByte(12)
      ..write(obj.isRegisterable)
      ..writeByte(13)
      ..write(obj.creator)
      ..writeByte(14)
      ..write(obj.organization)
      ..writeByte(15)
      ..write(obj.admins)
      ..writeByte(16)
<<<<<<< HEAD
      ..write(obj.attendees);
=======
      ..write(obj.attendees)
      ..writeByte(17)
      ..write(obj.agendaItems)
      ..writeByte(18)
      ..write(obj.isRecurringEventTemplate)
      ..writeByte(19)
      ..write(obj.baseEvent)
      ..writeByte(20)
      ..write(obj.progressLabel)
      ..writeByte(21)
      ..write(obj.sequenceNumber)
      ..writeByte(22)
      ..write(obj.totalCount)
      ..writeByte(23)
      ..write(obj.venues)
      ..writeByte(24)
      ..write(obj.recurrenceRule);
>>>>>>> upstream/develop
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
