
<div>

# getPosts method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Method used to fetch all posts of the current organisation.

**params**: None

**returns**:

-   `Future<void>`: returns future void



## Implementation

``` language-dart
Future<void>  async {
  final List<Post> newPosts = await ;
  newPosts.forEach((post) {
    if (!_renderedPostID.contains(post.sId)) {
      _posts.insert(0, post);
      _renderedPostID.add(post.sId);
    }
  });
  debugPrint(_posts.length.);
  _postStreamController.add(_posts);
}
```







1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  getPosts method

##### PostService class







