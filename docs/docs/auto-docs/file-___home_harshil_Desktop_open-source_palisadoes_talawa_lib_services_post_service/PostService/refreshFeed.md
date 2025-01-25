




refreshFeed method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. refreshFeed method

refreshFeed


dark\_mode

light\_mode




# refreshFeed method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
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
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. refreshFeed method

##### PostService class





talawa
1.0.0+1






