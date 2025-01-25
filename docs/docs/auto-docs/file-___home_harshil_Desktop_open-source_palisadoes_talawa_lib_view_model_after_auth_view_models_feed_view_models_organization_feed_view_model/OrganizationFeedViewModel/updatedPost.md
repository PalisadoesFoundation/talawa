




updatedPost method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. updatedPost method

updatedPost


dark\_mode

light\_mode




# updatedPost method


void
updatedPost(

1. dynamic post

)

This function updates the post.

**params**:

* `post`: post object

**returns**:
None


## Implementation

```
void updatedPost(Post post) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == post.sId) {
      _posts[i] = post;
      notifyListeners();
      break;
    }
  }
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. updatedPost method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






