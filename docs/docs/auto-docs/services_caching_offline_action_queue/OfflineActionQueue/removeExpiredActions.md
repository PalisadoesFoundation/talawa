
<div>

# removeExpiredActions method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Removes expired actions from the queue.

**params**: None

**returns**:

-   `Future<bool>`: returns true if expired actions were removed
    successfully, otherwise false.



## Implementation

``` language-dart
Future<bool>  async {
  try {
    final now = DateTime.;
    final expiredKeys = _actionsBox.keys.where((key) {
      final CachedUserAction action = _actionsBox.get(key)!;
      return action.expiry.isBefore(now);
    }).;
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







1.  [talawa](../../index.html)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  removeExpiredActions method

##### OfflineActionQueue class







