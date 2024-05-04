


# deleteTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> deleteTask
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) creatorId)





<p>This function deletes the task for an event.
The function uses <code>deleteTask</code> method of Task Service.</p>
<p>params:</p>
<ul>
<li><code>taskId</code> : id of the task need to be deleted.</li>
<li><code>creatorId</code> : id of the task creator.</li>
</ul>



## Implementation

```dart
Future<void> deleteTask(String taskId, String creatorId) async {
  await _taskService.deleteTask(taskId, creatorId);
  notifyListeners();
}
```







