// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 6;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      id: fields[0] as String?,
      caption: fields[1] as String?,
      createdAt: fields[6] as DateTime?,
      attachments: (fields[5] as List?)?.cast<AttachmentModel>(),
      creator: fields[7] as User?,
      organization: fields[10] as OrgInfo?,
      commentsCount: fields[2] as int?,
      upvotesCount: fields[3] as int?,
      downvotesCount: fields[4] as int?,
      voteType: fields[9] as String?,
      isPinned: fields[11] as bool?,
      pinnedAt: fields[12] as DateTime?,
      hasVoted: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.caption)
      ..writeByte(2)
      ..write(obj.commentsCount)
      ..writeByte(3)
      ..write(obj.upvotesCount)
      ..writeByte(4)
      ..write(obj.downvotesCount)
      ..writeByte(5)
      ..write(obj.attachments)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.creator)
      ..writeByte(8)
      ..write(obj.hasVoted)
      ..writeByte(9)
      ..write(obj.voteType)
      ..writeByte(10)
      ..write(obj.organization)
      ..writeByte(11)
      ..write(obj.isPinned)
      ..writeByte(12)
      ..write(obj.pinnedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
