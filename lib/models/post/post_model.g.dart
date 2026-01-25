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
<<<<<<< HEAD
      sId: fields[0] as String,
      description: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      imageUrl: fields[3] as String?,
      base64String: fields[4] as String?,
      videoUrl: fields[5] as String?,
      creator: fields[6] as User?,
      organization: fields[7] as OrgInfo?,
      likedBy: (fields[8] as List?)?.cast<LikedBy>(),
      comments: (fields[9] as List?)?.cast<Comments>(),
=======
      id: fields[0] as String?,
      caption: fields[1] as String?,
      createdAt: fields[5] as DateTime?,
      attachments: (fields[4] as List?)?.cast<AttachmentModel>(),
      creator: fields[6] as User?,
      organization: fields[9] as OrgInfo?,
      commentsCount: fields[2] as int?,
      upvotesCount: fields[3] as int?,
      downvotesCount: fields[12] as int?,
      voteType: fields[8] as VoteType?,
      isPinned: fields[10] as bool?,
      pinnedAt: fields[11] as DateTime?,
      hasVoted: fields[7] as bool?,
>>>>>>> upstream/develop
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
<<<<<<< HEAD
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.base64String)
      ..writeByte(5)
      ..write(obj.videoUrl)
      ..writeByte(6)
      ..write(obj.creator)
      ..writeByte(7)
      ..write(obj.organization)
      ..writeByte(8)
      ..write(obj.likedBy)
      ..writeByte(9)
      ..write(obj.comments);
=======
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
      ..write(obj.attachments)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.creator)
      ..writeByte(7)
      ..write(obj.hasVoted)
      ..writeByte(8)
      ..write(obj.voteType)
      ..writeByte(9)
      ..write(obj.organization)
      ..writeByte(10)
      ..write(obj.isPinned)
      ..writeByte(11)
      ..write(obj.pinnedAt)
      ..writeByte(12)
      ..write(obj.downvotesCount);
>>>>>>> upstream/develop
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
<<<<<<< HEAD

class LikedByAdapter extends TypeAdapter<LikedBy> {
  @override
  final int typeId = 8;

  @override
  LikedBy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedBy(
      sId: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LikedBy obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedByAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CommentsAdapter extends TypeAdapter<Comments> {
  @override
  final int typeId = 9;

  @override
  Comments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comments(
      sId: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Comments obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
=======
>>>>>>> upstream/develop
