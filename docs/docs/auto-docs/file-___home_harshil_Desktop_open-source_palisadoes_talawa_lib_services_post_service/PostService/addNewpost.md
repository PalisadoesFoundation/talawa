




addNewpost method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. addNewpost method

addNewpost


dark\_mode

light\_mode




# addNewpost method


void
addNewpost(

1. dynamic newPost

)

Method to add newly created post at the very top of the feed.

**params**:

* `newPost`: new post made by user to add in feed

**returns**:
None


## Implementation

```
void addNewpost(Post newPost) {
  if (!_posts.contains(newPost)) {
    _posts.insert(0, newPost);
  }
  _postStreamController.add(_posts);
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. addNewpost method

##### PostService class





talawa
1.0.0+1






