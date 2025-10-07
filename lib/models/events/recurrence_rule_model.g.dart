// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrence_rule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecurrenceRuleAdapter extends TypeAdapter<RecurrenceRule> {
  @override
  final int typeId = 32;

  @override
  RecurrenceRule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurrenceRule(
      frequency: fields[0] as String,
      interval: fields[1] as int?,
      endDate: fields[2] as DateTime?,
      recurrenceEndDate: fields[3] as DateTime?,
      count: fields[4] as int?,
      never: fields[5] as bool?,
      byDay: (fields[6] as List?)?.cast<String>(),
      byMonth: (fields[7] as List?)?.cast<int>(),
      byMonthDay: (fields[8] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecurrenceRule obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.frequency)
      ..writeByte(1)
      ..write(obj.interval)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.recurrenceEndDate)
      ..writeByte(4)
      ..write(obj.count)
      ..writeByte(5)
      ..write(obj.never)
      ..writeByte(6)
      ..write(obj.byDay)
      ..writeByte(7)
      ..write(obj.byMonth)
      ..writeByte(8)
      ..write(obj.byMonthDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurrenceRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
