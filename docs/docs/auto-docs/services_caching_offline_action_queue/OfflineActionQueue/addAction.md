
<div>

# addAction method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
addAction(

1.  [[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.md)]
    action]

)



Adds an action to the queue with a TTL.

**params**:

-   `action`: the action to be added.

**returns**:

-   `Future<bool>`: returns true if the action was added successfully,
    otherwise false.



## Implementation

``` language-dart
Future<bool> addAction(CachedUserAction action) async {
  try {
    await _actionsBox.put(action.id, action);
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to add action: $e');
    return false;
  }
}
```







1.  [talawa](../../index.md)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.md)
4.  addAction method

##### OfflineActionQueue class







