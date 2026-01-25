// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedUserActionStatusAdapter
    extends TypeAdapter<CachedUserActionStatus> {
  @override
  final int typeId = 4;

  @override
  CachedUserActionStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CachedUserActionStatus.pending;
      case 1:
        return CachedUserActionStatus.completed;
      default:
        return CachedUserActionStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, CachedUserActionStatus obj) {
    switch (obj) {
      case CachedUserActionStatus.pending:
        writer.writeByte(0);
<<<<<<< HEAD
        break;
      case CachedUserActionStatus.completed:
        writer.writeByte(1);
        break;
=======
        return;
      case CachedUserActionStatus.completed:
        writer.writeByte(1);
        return;
>>>>>>> upstream/develop
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedUserActionStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CachedOperationTypeAdapter extends TypeAdapter<CachedOperationType> {
  @override
<<<<<<< HEAD
  final int typeId = 5;
=======
  final int typeId = 9;
>>>>>>> upstream/develop

  @override
  CachedOperationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CachedOperationType.gqlAuthQuery;
      case 1:
        return CachedOperationType.gqlAuthMutation;
      case 2:
        return CachedOperationType.gqlNonAuthQuery;
      case 3:
        return CachedOperationType.gqlNonAuthMutation;
      default:
        return CachedOperationType.gqlAuthQuery;
    }
  }

  @override
  void write(BinaryWriter writer, CachedOperationType obj) {
    switch (obj) {
      case CachedOperationType.gqlAuthQuery:
        writer.writeByte(0);
<<<<<<< HEAD
        break;
      case CachedOperationType.gqlAuthMutation:
        writer.writeByte(1);
        break;
      case CachedOperationType.gqlNonAuthQuery:
        writer.writeByte(2);
        break;
      case CachedOperationType.gqlNonAuthMutation:
        writer.writeByte(3);
        break;
=======
        return;
      case CachedOperationType.gqlAuthMutation:
        writer.writeByte(1);
        return;
      case CachedOperationType.gqlNonAuthQuery:
        writer.writeByte(2);
        return;
      case CachedOperationType.gqlNonAuthMutation:
        writer.writeByte(3);
        return;
>>>>>>> upstream/develop
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedOperationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
<<<<<<< HEAD
=======

class VoteTypeAdapter extends TypeAdapter<VoteType> {
  @override
  final int typeId = 13;

  @override
  VoteType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VoteType.upVote;
      case 1:
        return VoteType.downVote;
      case 2:
        return VoteType.none;
      default:
        return VoteType.upVote;
    }
  }

  @override
  void write(BinaryWriter writer, VoteType obj) {
    switch (obj) {
      case VoteType.upVote:
        writer.writeByte(0);
        return;
      case VoteType.downVote:
        writer.writeByte(1);
        return;
      case VoteType.none:
        writer.writeByte(2);
        return;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
>>>>>>> upstream/develop
