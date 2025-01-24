




Post class - post\_model library - Dart API







menu

1. [talawa](../index.html)
2. [models/post/post\_model.dart](../models_post_post_model/models_post_post_model-library.html)
3. Post class

Post


dark\_mode

light\_mode




# Post class


This class creates a Post model.


Annotations

* @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId: 6)



## Constructors

[Post](../models_post_post_model/Post/Post.html)({required String sId, String? description, DateTime? createdAt, String? imageUrl, String? base64String, String? videoUrl, required [User](../models_user_user_info/User-class.html)? creator, [OrgInfo](../models_organization_org_info/OrgInfo-class.html)? organization, List<[LikedBy](../models_post_post_model/LikedBy-class.html)>? likedBy, List<[Comments](../models_post_post_model/Comments-class.html)>? comments})


[Post.fromJson](../models_post_post_model/Post/Post.fromJson.html)(Map<String, dynamic> json)

Creating a new Post instance from a map structure.



## Properties

[base64String](../models_post_post_model/Post/base64String.html)
↔ String?

Base64 encoded string of an image attached to the post.
getter/setter pair

[comments](../models_post_post_model/Post/comments.html)
↔ List<[Comments](../models_post_post_model/Comments-class.html)>?

List of comments on the post.
getter/setter pair

[createdAt](../models_post_post_model/Post/createdAt.html)
↔ DateTime?

Creation timestamp of the post.
getter/setter pair

[creator](../models_post_post_model/Post/creator.html)
↔ [User](../models_user_user_info/User-class.html)?

User who created the post.
getter/setter pair

[description](../models_post_post_model/Post/description.html)
↔ String?

Description of the post.
getter/setter pair

[hashCode](../models_post_post_model/Post/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[imageUrl](../models_post_post_model/Post/imageUrl.html)
↔ String?

URL of the image attached to the post.
getter/setter pair

[likedBy](../models_post_post_model/Post/likedBy.html)
↔ List<[LikedBy](../models_post_post_model/LikedBy-class.html)>?

List of users who liked the post.
getter/setter pair

[organization](../models_post_post_model/Post/organization.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?

Organization associated with the post.
getter/setter pair

[runtimeType](../models_post_post_model/Post/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[sId](../models_post_post_model/Post/sId.html)
↔ String

unique identifier for post.
getter/setter pair

[videoUrl](../models_post_post_model/Post/videoUrl.html)
↔ String?

URL of a video attached to the post.
getter/setter pair



## Methods

[getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.html)()
→ String


this is to get duration of post.

[noSuchMethod](../models_post_post_model/Post/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../models_post_post_model/Post/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../models_post_post_model/Post/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [post\_model](../models_post_post_model/models_post_post_model-library.html)
3. Post class

##### post\_model library





talawa
1.0.0+1






