




nextPage method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. nextPage method

nextPage


dark\_mode

light\_mode




# nextPage method


Future<void>
nextPage()

Method to handle pagination by fetching next page of posts.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> nextPage() async {
  if (postInfo!['hasNextPage'] == true) {
    _posts.clear();
    _renderedPostID.clear();
    after = postInfo!['endCursor'] as String;
    before = null;
    first = 5;
    last = null;
    await getPosts();
  }
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. nextPage method

##### PostService class





talawa
1.0.0+1






