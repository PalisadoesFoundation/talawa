
<div>

# refreshFeed method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Method to refresh feed of current selected organisation.

**params**: None

**returns**:

-   `Future<void>`: returns future void



## Implementation

``` language-dart
Future<void>  async {
  final List<Post> newPosts = await ;
  _renderedPostID.;
  _posts.;
  _posts = newPosts;
  GraphqlExceptionResolver.encounteredExceptionOrError(
    CriticalActionException('Feed refreshed!!!'),
  );
  _postStreamController.add(_posts);
}
```







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  refreshFeed method

##### PostService class







