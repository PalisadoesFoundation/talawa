




addNewPost method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. addNewPost method

addNewPost


dark\_mode

light\_mode




# addNewPost method


void
addNewPost(

1. dynamic newPost

)

This function adds new Post.

**params**:

* `newPost`: define\_the\_param

**returns**:
None


## Implementation

```
void addNewPost(Post newPost) {
  _posts.insert(0, newPost);
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. addNewPost method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






