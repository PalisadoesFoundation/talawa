


# fetchTasksByUser method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchTasksByUser
()





<p>This function fetch tasks created by the current user for an event.
The function uses <code>getTasksByUser</code> method of Task Service.</p>



## Implementation

```dart
Future<void> fetchTasksByUser() async {
  setState(ViewState.busy);
  await _taskService.getTasksByUser();
  setState(ViewState.idle);
}
```







