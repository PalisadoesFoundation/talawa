
<div>

# Post class

</div>


This class creates a Post model.




Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        6)



## Constructors

[[Post](../models_post_post_model/Post/Post.html)][({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] sId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] description, ][[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?] createdAt, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] imageUrl, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] base64String, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] videoUrl, ][required [[User](../models_user_user_info/User-class.html)?] creator, ][[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?] organization, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]\>]?] likedBy, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../models_post_post_model/Comments-class.html)]\>]?] comments]})]

:   

[[Post.fromJson](../models_post_post_model/Post/Post.fromJson.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]
:   Creating a new Post instance from a map structure.



## Properties

[[base64String](../models_post_post_model/Post/base64String.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Base64 encoded string of an image attached to the post.
    ::: features
    getter/setter pair
    :::

[[comments](../models_post_post_model/Post/comments.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../models_post_post_model/Comments-class.html)]\>]?]
:   List of comments on the post.
    ::: features
    getter/setter pair
    :::

[[createdAt](../models_post_post_model/Post/createdAt.html)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   Creation timestamp of the post.
    ::: features
    getter/setter pair
    :::

[[creator](../models_post_post_model/Post/creator.html)] [↔ [User](../models_user_user_info/User-class.html)?]
:   User who created the post.
    ::: features
    getter/setter pair
    :::

[[description](../models_post_post_model/Post/description.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Description of the post.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[imageUrl](../models_post_post_model/Post/imageUrl.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   URL of the image attached to the post.
    ::: features
    getter/setter pair
    :::

[[likedBy](../models_post_post_model/Post/likedBy.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]\>]?]
:   List of users who liked the post.
    ::: features
    getter/setter pair
    :::

[[organization](../models_post_post_model/Post/organization.html)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]
:   Organization associated with the post.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[sId](../models_post_post_model/Post/sId.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   unique identifier for post.
    ::: features
    getter/setter pair
    :::

[[videoUrl](../models_post_post_model/Post/videoUrl.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   URL of a video attached to the post.
    ::: features
    getter/setter pair
    :::



## Methods

[[getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   this is to get duration of post.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [post_model](../models_post_post_model/)
3.  Post class

##### post_model library







