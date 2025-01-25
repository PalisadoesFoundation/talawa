




PostService constructor - PostService - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. PostService constructor

PostService


dark\_mode

light\_mode




# PostService constructor


PostService()

## Implementation

```
PostService() : super(HiveKeys.postFeedKey) {
  _postStream = _postStreamController.stream.asBroadcastStream();
  _updatedPostStream =
      _updatedPostStreamController.stream.asBroadcastStream();
  _currentOrg = _userConfig.currentOrg;
  setOrgStreamSubscription();
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. PostService constructor

##### PostService class





talawa
1.0.0+1






