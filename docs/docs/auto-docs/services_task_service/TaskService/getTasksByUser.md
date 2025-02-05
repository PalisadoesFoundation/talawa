


# getTasksByUser method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getTasksByUser
()





<p>This function is used to fetch and return all tasks added by the current user.</p>



## Implementation

```dart
Future<void> getTasksByUser() async {
  await _databaseMutationFunctions
      .refreshAccessToken(_userConfig.currentUser.refreshToken!);
  final res = await _databaseMutationFunctions
      .gqlNonAuthQuery(TaskQueries.userTasks(_userConfig.currentUser.id!));

  if (res != null) {
    _tasks.clear();
    final tasksList = res.data!['tasksByUser'] as List;
    tasksList.forEach((task) {
      _tasks.add(Task.fromJson(task as Map<String, dynamic>));
    });
  }
}
```







