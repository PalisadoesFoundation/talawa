



menu

1.  [talawa](../index.md)
2.  [models/post/post_model.dart](../models_post_post_model/)
3.  Post class


Post


 dark_mode   light_mode 




<div>

# Post class

</div>


This class creates a Post model.




Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType/HiveType.html)(typeId:
        6)



## Constructors

[[Post](../models_post_post_model/Post/Post.md)][]

:   

[[Post.fromJson](../models_post_post_model/Post/Post.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]
:   Creating a new Post instance from a map structure.



## Properties

[[attachments](../models_post_post_model/Post/attachments.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AttachmentModel](../models_attachments_attachment_model/AttachmentModel-class.md)]\>]?]
:   Attachments associated with the post.
    ::: features
    getter/setter pair
    :::

[[caption](../models_post_post_model/Post/caption.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Caption of the post.
    ::: features
    getter/setter pair
    :::

[[commentsCount](../models_post_post_model/Post/commentsCount.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   Number of Comments on the post.
    ::: features
    getter/setter pair
    :::

[[createdAt](../models_post_post_model/Post/createdAt.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   Creation timestamp of the post.
    ::: features
    getter/setter pair
    :::

[[creator](../models_post_post_model/Post/creator.md)] [↔ [User](../models_user_user_info/User-class.md)?]
:   User who created the post.
    ::: features
    getter/setter pair
    :::

[[downvotesCount](../models_post_post_model/Post/downvotesCount.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   Number of downvotes on the post.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasVoted](../models_post_post_model/Post/hasVoted.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Variable to check if post is voted by the user.
    ::: features
    getter/setter pair
    :::

[[id](../models_post_post_model/Post/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   unique identifier for post.
    ::: features
    getter/setter pair
    :::

[[isPinned](../models_post_post_model/Post/isPinned.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   Variable to check if post is pinned by the user.
    ::: features
    getter/setter pair
    :::

[[organization](../models_post_post_model/Post/organization.md)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?]
:   Organization associated with the post.
    ::: features
    getter/setter pair
    :::

[[pinnedAt](../models_post_post_model/Post/pinnedAt.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   Timestamp when the post was pinned.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[upvotesCount](../models_post_post_model/Post/upvotesCount.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   Number of upvotes on the post.
    ::: features
    getter/setter pair
    :::

[[voteType](../models_post_post_model/Post/voteType.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Variable to check the type of vote on the post by the user (if not
    voted then null).
    ::: features
    getter/setter pair
    :::



## Methods

[[getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.md)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   this is to get duration of post.

[[getPostPinnedDuration](../models_post_post_model/Post/getPostPinnedDuration.md)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   this is to get duration of pinned post.

[[getPresignedUrl](../models_post_post_model/Post/getPresignedUrl.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?] id]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to get the presigned URL for a file attachment.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::



## Constants

[[fallbackAttachmentUrl](../models_post_post_model/Post/fallbackAttachmentUrl-constant.md)] [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Fallback URL for post attachments.







1.  [talawa](../index.md)
2.  [post_model](../models_post_post_model/)
3.  Post class

##### post_model library









 talawa 1.0.0+1 
