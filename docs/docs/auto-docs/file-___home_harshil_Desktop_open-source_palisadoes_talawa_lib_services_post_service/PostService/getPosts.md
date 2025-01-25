




getPosts method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. getPosts method

getPosts


dark\_mode

light\_mode




# getPosts method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getPosts()

Method used to fetch all posts of the current organisation.

**params**:
None

**returns**:

* `Future<void>`: returns future void

## Implementation

```
Future<void> getPosts() async {
  final List<Post> newPosts = await getNewFeedAndRefreshCache();
  newPosts.forEach((post) {
    if (!_renderedPostID.contains(post.sId)) {
      _posts.insert(0, post);
      _renderedPostID.add(post.sId);
    }
  });
  debugPrint(_posts.length.toString());
  _postStreamController.add(_posts);
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. getPosts method

##### PostService class





talawa
1.0.0+1






