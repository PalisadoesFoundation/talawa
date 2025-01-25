




addAction method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. addAction method

addAction


dark\_mode

light\_mode




# addAction method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
addAction(

1. dynamic action

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
2. [offline\_action\_queue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. addAction method

##### OfflineActionQueue class





talawa
1.0.0+1






