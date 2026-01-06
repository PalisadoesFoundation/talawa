
<div>

# removeLike method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
removeLike(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postID]

)



Method to remove like in a Post.

This method basically update likedBy list of a Post and removes the like
of a user in database.

**params**:

-   `postID`: ID of the post to remove like in database.

**returns**:

-   `Future&lt;void&gt;`: nothing



## Implementation

``` language-dart
Future&lt;bool&gt; removeLike(String postID) async 
```







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  removeLike method

##### PostService class







