
<div>

# getActions method

</div>


[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.md)]\>]]




Retrieves all valid actions from the queue.

**params**: None

**returns**:

-   `List<CachedUserAction>`: a list of valid actions.



## Implementation

``` language-dart
List<CachedUserAction>  {
  try {
    final now = DateTime.;
    final validActions = _actionsBox.values
        .where((action) => action.expiry.isAfter(now))
        .;
    ;
    return validActions;
  } catch (e) {
    // Handle or log the exception
    print('Failed to get actions: $e');
    return [];
  }
}
```







1.  [talawa](../../index.md)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.md)
4.  getActions method

##### OfflineActionQueue class







