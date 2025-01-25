




dispose method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. dispose method

dispose


dark\_mode

light\_mode




# dispose method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
dispose()

## Implementation

```
@override
void dispose() {
  // Canceling the subscription so that there will be no rebuild after the widget is disposed.
  _currentOrganizationStreamSubscription.cancel();
  _postsSubscription.cancel();
  _updatePostSubscription.cancel();
  super.dispose();
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. dispose method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






