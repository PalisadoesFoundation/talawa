
<div>

# navigateToIndividualPage method

</div>


void navigateToIndividualPage(

1.  [[[Post](../../models_post_post_model/Post-class.html)]
    post]

)



This function navigate to individual post page..

**params**:

-   `post`: define_the_param

**returns**: None



## Implementation

``` language-dart
void navigateToIndividualPage(Post post) {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(Routes.individualPost, arguments: post);
}
```







1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  navigateToIndividualPage method

##### OrganizationFeedViewModel class







