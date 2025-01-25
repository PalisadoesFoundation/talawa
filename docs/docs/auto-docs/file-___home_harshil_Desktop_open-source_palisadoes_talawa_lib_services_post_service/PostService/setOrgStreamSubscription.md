




setOrgStreamSubscription method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. setOrgStreamSubscription method

setOrgStreamSubscription


dark\_mode

light\_mode




# setOrgStreamSubscription method


void
setOrgStreamSubscription()

This method sets up a stream that constantly listens to change in current org.

**params**:
None

**returns**:
None


## Implementation

```
void setOrgStreamSubscription() {
  _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    if (updatedOrganization != _currentOrg) {
      _renderedPostID.clear();
      _currentOrg = updatedOrganization;
      getPosts();
    }
  });
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. setOrgStreamSubscription method

##### PostService class





talawa
1.0.0+1






