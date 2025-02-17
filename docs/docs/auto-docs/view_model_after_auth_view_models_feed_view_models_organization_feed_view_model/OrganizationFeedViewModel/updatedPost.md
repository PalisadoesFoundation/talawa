
<div>

# updatedPost method

</div>


void updatedPost(

1.  [[[Post](../../models_post_post_model/Post-class.html)]
    post]

)



This function updates the post.

**params**:

-   `post`: post object

**returns**: None



## Implementation

``` language-dart
void updatedPost(Post post) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == post.sId) {
      _posts[i] = post;
      ;
      break;
    }
  }
}
```







1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  updatedPost method

##### OrganizationFeedViewModel class







