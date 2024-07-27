


# Post class









<p>This class creates a Post model.</p>




## Constructors

[Post](../models_post_post_model/Post/Post.md) ({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) sId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)? createdAt, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? imageUrl, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? videoUrl, required [User](../models_user_user_info/User-class.md)? creator, [OrgInfo](../models_organization_org_info/OrgInfo-class.md)? organization, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[LikedBy](../models_post_post_model/LikedBy-class.md)>? likedBy, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Comments](../models_post_post_model/Comments-class.md)>? comments})

   

[Post.fromJson](../models_post_post_model/Post/Post.fromJson.md) ([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)

Creating a new Post instance from a map structure.   


## Properties

##### [comments](../models_post_post_model/Post/comments.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Comments](../models_post_post_model/Comments-class.md)>?



comments for post.  
_<span class="feature">read / write</span>_



##### [createdAt](../models_post_post_model/Post/createdAt.md) &#8596; [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?



createdAt for post.  
_<span class="feature">read / write</span>_



##### [creator](../models_post_post_model/Post/creator.md) &#8596; [User](../models_user_user_info/User-class.md)?



creator for post.  
_<span class="feature">read / write</span>_



##### [description](../models_post_post_model/Post/description.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?



description for post.  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [imageUrl](../models_post_post_model/Post/imageUrl.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?



imageUrl for post.  
_<span class="feature">read / write</span>_



##### [likedBy](../models_post_post_model/Post/likedBy.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[LikedBy](../models_post_post_model/LikedBy-class.md)>?



likedBy for post.  
_<span class="feature">read / write</span>_



##### [organization](../models_post_post_model/Post/organization.md) &#8596; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?



organization for post.  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [sId](../models_post_post_model/Post/sId.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



unique identifier for post.  
_<span class="feature">read / write</span>_



##### [videoUrl](../models_post_post_model/Post/videoUrl.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?



videoUrl for post.  
_<span class="feature">read / write</span>_





## Methods

##### [getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.md)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



this is to get duration of post.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















