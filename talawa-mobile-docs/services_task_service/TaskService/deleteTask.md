


# deleteTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> deleteTask
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) creatorId)





<p>This function is used to delete a task.</p>
<p>params:</p>
<ul>
<li><code>taskId</code> : id of a task need to be deleted.</li>
<li><code>creatorId</code> : id of the task creator.</li>
</ul>



## Implementation

```dart
Future<void> deleteTask(String taskId, String creatorId) async {
  if (creatorId == _userConfig.currentUser.id) {
    await _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res = await _databaseMutationFunctions
        .gqlAuthMutation(TaskQueries.deleteTask(taskId));
    if (res != null) _tasks.removeWhere((task) => task.id == taskId);
  }
}
```







