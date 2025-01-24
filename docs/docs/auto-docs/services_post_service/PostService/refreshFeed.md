




refreshFeed method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. refreshFeed method

refreshFeed


dark\_mode

light\_mode




# refreshFeed method


Future<void>
refreshFeed()

Method to refresh feed of current selected organisation.

**params**:
None

**returns**:

* `Future<void>`: returns future void

## Implementation

```
Future<void> refreshFeed() async {
  final List<Post> newPosts = await getNewFeedAndRefreshCache();
  _renderedPostID.clear();
  _posts.clear();
  _posts = newPosts;
  GraphqlExceptionResolver.encounteredExceptionOrError(
    CriticalActionException('Feed refreshed!!!'),
  );
  _postStreamController.add(_posts);
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. refreshFeed method

##### PostService class





talawa
1.0.0+1






