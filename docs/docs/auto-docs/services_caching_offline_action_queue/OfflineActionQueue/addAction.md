




addAction method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.html)
3. [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. addAction method

addAction


dark\_mode

light\_mode




# addAction method


Future<bool>
addAction(

1. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html) action

)

Adds an action to the queue with a TTL.

**params**:

* `action`: the action to be added.

**returns**:

* `Future<bool>`: returns true if the action was added successfully, otherwise false.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [offline\_action\_queue](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.html)
3. [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. addAction method

##### OfflineActionQueue class





talawa
1.0.0+1






