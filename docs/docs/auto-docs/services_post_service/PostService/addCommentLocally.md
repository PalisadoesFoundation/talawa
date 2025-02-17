
<div>

# addCommentLocally method

</div>


void addCommentLocally(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postID]

)



Method to add comment of a user and update comments using updated Post
Stream.

**params**:

-   `postID`: ID of the post to add comment locally

**returns**: None



## Implementation

``` language-dart
void addCommentLocally(String postID) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == postID) {
      _posts[i].comments!.add(Comments(sId: postID));
      _updatedPostStreamController.add(_posts[i]);
    }
  }
}
```







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  addCommentLocally method

##### PostService class







