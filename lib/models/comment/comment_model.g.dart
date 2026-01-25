// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final int typeId = 12;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comment(
<<<<<<< HEAD
      text: fields[0] as String?,
      createdAt: fields[1] as String?,
      creator: fields[2] as User?,
      post: fields[3] as String?,
      likeCount: fields[4] as String?,
=======
      body: fields[1] as String?,
      createdAt: fields[2] as String?,
      creator: fields[3] as User?,
      post: fields[4] as Post?,
      id: fields[0] as String?,
      hasVoted: fields[5] as bool?,
      upvotesCount: fields[6] as int?,
      downvotesCount: fields[7] as int?,
      voteType: fields[8] as VoteType?,
>>>>>>> upstream/develop
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer
<<<<<<< HEAD
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.creator)
      ..writeByte(3)
      ..write(obj.post)
      ..writeByte(4)
      ..write(obj.likeCount);
=======
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.creator)
      ..writeByte(4)
      ..write(obj.post)
      ..writeByte(5)
      ..write(obj.hasVoted)
      ..writeByte(6)
      ..write(obj.upvotesCount)
      ..writeByte(7)
      ..write(obj.downvotesCount)
      ..writeByte(8)
      ..write(obj.voteType);
>>>>>>> upstream/develop
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
