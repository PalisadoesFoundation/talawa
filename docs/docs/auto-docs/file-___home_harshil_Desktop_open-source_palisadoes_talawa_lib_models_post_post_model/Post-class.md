




Post class - post\_model library - Dart API







menu

1. [talawa](../index.html)
2. [models/post/post\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. Post class

Post


dark\_mode

light\_mode




# Post class


This class creates a Post model.


## Constructors

[Post](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/Post.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) sId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)? createdAt, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? imageUrl, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? base64String, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? videoUrl, required dynamic creator, dynamic organization, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[LikedBy](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedBy-class.html)>? likedBy, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Comments](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)>? comments})


[Post.fromJson](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/Post.fromJson.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)

Creating a new Post instance from a map structure.



## Properties

[base64String](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/base64String.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

Base64 encoded string of an image attached to the post.
getter/setter pair

[comments](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/comments.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Comments](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)>?

List of comments on the post.
getter/setter pair

[createdAt](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/createdAt.html)
↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?

Creation timestamp of the post.
getter/setter pair

[creator](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/creator.html)
↔ dynamic

User who created the post.
getter/setter pair

[description](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/description.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

Description of the post.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[imageUrl](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/imageUrl.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

URL of the image attached to the post.
getter/setter pair

[likedBy](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/likedBy.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[LikedBy](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedBy-class.html)>?

List of users who liked the post.
getter/setter pair

[organization](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/organization.html)
↔ dynamic

Organization associated with the post.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[sId](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/sId.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

unique identifier for post.
getter/setter pair

[videoUrl](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/videoUrl.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

URL of a video attached to the post.
getter/setter pair



## Methods

[getPostCreatedDuration](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post/getPostCreatedDuration.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


this is to get duration of post.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [post\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. Post class

##### post\_model library





talawa
1.0.0+1






