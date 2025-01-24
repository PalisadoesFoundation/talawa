




fetchPostsInitial method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. fetchPostsInitial method

fetchPostsInitial


dark\_mode

light\_mode




# fetchPostsInitial method


Future<void>
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
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. fetchPostsInitial method

##### PostService class





talawa
1.0.0+1






