




clearActions method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.html)
3. [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. clearActions method

clearActions


dark\_mode

light\_mode




# clearActions method


Future<bool>
clearActions()

Clears all actions from the queue.

**params**:
None

**returns**:

* `Future<bool>`: returns true if all actions were cleared successfully, otherwise false.

## Implementation

```
Future<bool> clearActions() async {
  try {
    await _actionsBox.clear();
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to clear actions: $e');
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [offline\_action\_queue](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.html)
3. [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. clearActions method

##### OfflineActionQueue class





talawa
1.0.0+1






