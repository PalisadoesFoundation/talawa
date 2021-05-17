// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<Posts> postsFromJson(String str) => List<Posts>.from(json
    .decode(str)
    .map((x) => Posts.fromJson(x as Map<String, dynamic>)) as Iterable);

String postsToJson(List<Posts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  Posts({
    @required this.id,
    this.text,
    this.createdAt,
    this.imageUrl,
    this.videoUrl,
    this.title,
    this.commentCount,
    this.likeCount,
    this.likedBy,
    this.comments,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["_id"] as String,
        text: json["text"] as String,
        createdAt: json["createdAt"] as String,
        imageUrl: json["imageUrl"] as String,
        videoUrl: json["videoUrl"] as String,
        title: json["title"] as String,
        commentCount: json["commentCount"] as int,
        likeCount: json["likeCount"] as int,
        likedBy: List<LikedBy>.from(json["likedBy"]
                .map((x) => LikedBy.fromJson(x as Map<String, dynamic>))
            as Iterable),
        comments: List<Comments>.from(json["comments"]
                .map((x) => Comments.fromJson(x as Map<String, dynamic>))
            as Iterable),
      );

  final String id;
  final String text;
  final String createdAt;
  final String imageUrl;
  final String videoUrl;
  final String title;
  int commentCount;
  int likeCount;
  List<LikedBy> likedBy;
  List<Comments> comments;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "createdAt": createdAt,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "title": title,
        "commentCount": commentCount,
        "likeCount": likeCount,
        "likedBy": List<dynamic>.from(likedBy.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comments {
  Comments({
    @required this.id,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["_id"] as String,
      );

  final String id;

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class LikedBy {
  LikedBy({
    @required this.id,
  });

  factory LikedBy.fromJson(Map<String, dynamic> json) => LikedBy(
        id: json["_id"] as String,
      );

  final String id;

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
