


# PostService class









<p>PostService class provides functions in the context of a Post.</p>
<p>Services include:</p>
<ul>
<li><code>getPosts</code> : to get all posts of the organization.</li>
<li><code>addLike</code> : to add like to the post.</li>
<li><code>removeLike</code> : to remove the like from the post.</li>
</ul>




## Constructors

[PostService](../services_post_service/PostService/PostService.md) ()

   


## Properties

##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [postStream](../services_post_service/PostService/postStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Post](../models_post_post_model/Post-class.md)>>



  
_<span class="feature">read-only</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [updatedPostStream](../services_post_service/PostService/updatedPostStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[Post](../models_post_post_model/Post-class.md)>



  
_<span class="feature">read-only</span>_





## Methods

##### [addCommentLocally](../services_post_service/PostService/addCommentLocally.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID) void



  




##### [addLike](../services_post_service/PostService/addLike.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to add Like to the Post.  




##### [getPosts](../services_post_service/PostService/getPosts.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function used to get all posts of an organization.
The function reference the organization Id from <code>_currentOrg</code>.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [removeLike](../services_post_service/PostService/removeLike.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to remove like from the Post.  




##### [setOrgStreamSubscription](../services_post_service/PostService/setOrgStreamSubscription.md)() void



  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















