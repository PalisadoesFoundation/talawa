




dispose method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. dispose method

dispose


dark\_mode

light\_mode




# dispose method


1. @override

void
dispose()
override

Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).

This method should only be called by the object's owner.

This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.


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
2. [organization\_feed\_view\_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. dispose method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






