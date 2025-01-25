




previousPage method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. previousPage method

previousPage


dark\_mode

light\_mode




# previousPage method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
previousPage()

Method to handle pagination by fetching previous page of posts.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> previousPage() async {
  if (postInfo!['hasPreviousPage'] == true) {
    _posts.clear();
    _renderedPostID.clear();
    before = postInfo!['startCursor'] as String;
    after = null;
    last = 5;
    first = null;
    await getPosts();
  }
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. previousPage method

##### PostService class





talawa
1.0.0+1






