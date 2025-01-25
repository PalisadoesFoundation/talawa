




fetchPostsInitial method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. fetchPostsInitial method

fetchPostsInitial


dark\_mode

light\_mode




# fetchPostsInitial method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
fetchPostsInitial()

## Implementation

```
Future<void> fetchPostsInitial() async {
  _posts = await loadCachedData();
  debugPrint('fetchPostInitial');
  debugPrint(_posts.length.toString());
  _postStreamController.add(_posts);
  refreshFeed();
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. fetchPostsInitial method

##### PostService class





talawa
1.0.0+1






