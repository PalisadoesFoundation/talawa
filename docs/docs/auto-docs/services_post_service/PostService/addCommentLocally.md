




addCommentLocally method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. addCommentLocally method

addCommentLocally


dark\_mode

light\_mode




# addCommentLocally method


void
addCommentLocally(

1. String postID

)

Method to add comment of a user and update comments using updated Post Stream.

**params**:

* `postID`: ID of the post to add comment locally

**returns**:
None


## Implementation

```
void addCommentLocally(String postID) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == postID) {
      _posts[i].comments!.add(Comments(sId: postID));
      _updatedPostStreamController.add(_posts[i]);
    }
  }
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. addCommentLocally method

##### PostService class





talawa
1.0.0+1






