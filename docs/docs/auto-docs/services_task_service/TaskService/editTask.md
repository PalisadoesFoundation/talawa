


# editTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> editTask
(\{required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId\})





<p>This function is used to edit the task created by the user.</p>
<p>params:</p>
<ul>
<li>```darttitle``` : task title.</li>
<li>```dartdescription``` : task description.</li>
<li>```dartdeadline``` : task deadline.</li>
<li>```darttaskId``` : task Id.</li>
</ul>



## Implementation

```dart
Future<bool> editTask(\{
  required String title,
  required String description,
  required String deadline,
  required String taskId,
\}) async \{
  _databaseMutationFunctions
      .refreshAccessToken(_userConfig.currentUser.refreshToken!);
  final res = await _databaseMutationFunctions.gqlAuthMutation(
    TaskQueries.editTask(
      title: title,
      description: description,
      deadline: deadline,
      taskId: taskId,
    ),
  );

  // if res is not null.
  if (res != null) \{
    final updatedtaskJson = res.data!['updateTask'] as Map<String, dynamic>;
    final index = _tasks.indexWhere((task) => task.id == taskId);
    if (index == -1) return false;
    final updatedtask = Task.fromJson(updatedtaskJson);
    updatedtask.event.title = _tasks[index].event.title;
    _tasks[index] = updatedtask;
    callbackNotifyListeners();
    // if successfully updated then return true.
    return true;
  \}
  return false;
\}
```







