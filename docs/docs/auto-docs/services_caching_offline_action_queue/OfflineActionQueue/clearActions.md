
<div>

# clearActions method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Clears all actions from the queue.

**params**: None

**returns**:

-   `Future<bool>`: returns true if all actions were cleared
    successfully, otherwise false.



## Implementation

``` language-dart
Future<bool>  async {
  try {
    await _actionsBox.;
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to clear actions: $e');
    return false;
  }
}
```







1.  [talawa](../../index.html)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  clearActions method

##### OfflineActionQueue class







