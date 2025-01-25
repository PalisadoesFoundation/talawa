




removeExpiredActions method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. removeExpiredActions method

removeExpiredActions


dark\_mode

light\_mode




# removeExpiredActions method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
removeExpiredActions()

Removes expired actions from the queue.

**params**:
None

**returns**:

* `Future<bool>`: returns true if expired actions were removed successfully, otherwise false.

## Implementation

```
Future<bool> removeExpiredActions() async {
  try {
    final now = DateTime.now();
    final expiredKeys = _actionsBox.keys.where((key) {
      final CachedUserAction action = _actionsBox.get(key)!;
      return action.expiry.isBefore(now);
    }).toList();
    for (final key in expiredKeys) {
      await _actionsBox.delete(key);
    }
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to remove expired actions: $e');
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [offline\_action\_queue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. removeExpiredActions method

##### OfflineActionQueue class





talawa
1.0.0+1






