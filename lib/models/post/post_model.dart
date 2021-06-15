class Post {
  Post(
      {required this.sId,
      this.description,
      this.createdAt,
      this.imageUrl,
      this.videoUrl,
      required this.creator,
      this.organization,
      this.likedBy,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    description = json['text'] as String?;
    createdAt = json['createdAt'] as String?;
    imageUrl = json['imageUrl'] as String?;
    videoUrl = json['videoUrl'] as String?;
    creator = (json['creator'] != null
        ? Creator.fromJson(json['creator'] as Map<String, dynamic>)
        : null)!;
    organization = json['organization'] != null
        ? Organization.fromJson(json['organization'] as Map<String, dynamic>)
        : null;
    if (json['likedBy'] != null) {
      likedBy = <LikedBy>[];
      json['likedBy'].forEach((v) {
        likedBy?.add(LikedBy.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments?.add(Comments.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  late String sId;
  String? description;
  String? createdAt;
  String? imageUrl;
  String? videoUrl;
  late Creator creator;
  Organization? organization;
  List<LikedBy>? likedBy;
  List<Comments>? comments;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    data['creator'] = this.creator.toJson();
    if (this.organization != null) {
      data['organization'] = this.organization?.toJson();
    }
    if (this.likedBy != null) {
      data['likedBy'] = this.likedBy?.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Creator {
  Creator({this.firstName, this.lastName});

  Creator.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }

  String? firstName;
  String? lastName;
}

class Organization {
  Organization({this.sId});

  Organization.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }
  String? sId;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['_id'] = this.sId;
    return data;
  }
}

class LikedBy {
  LikedBy({this.sId});
  LikedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  String? sId;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}

class Comments {
  Comments({this.sId});
  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  String? sId;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}
