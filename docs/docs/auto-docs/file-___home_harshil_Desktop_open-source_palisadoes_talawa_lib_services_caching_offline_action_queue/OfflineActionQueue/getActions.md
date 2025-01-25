




getActions method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. getActions method

getActions


dark\_mode

light\_mode




# getActions method


[List](https://api.flutter.dev/flutter/dart-core/List-class.html)
getActions()

Retrieves all valid actions from the queue.

**params**:
None

**returns**:

* `List<CachedUserAction>`: a list of valid actions.

## Implementation

```
List<CachedUserAction> getActions() {
  try {
    final now = DateTime.now();
    final validActions = _actionsBox.values
        .where((action) => action.expiry.isAfter(now))
        .toList();
    removeExpiredActions();
    return validActions;
  } catch (e) {
    // Handle or log the exception
    print('Failed to get actions: $e');
    return [];
  }
}
```

 


1. [talawa](../../index.html)
2. [offline\_action\_queue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. getActions method

##### OfflineActionQueue class





talawa
1.0.0+1






