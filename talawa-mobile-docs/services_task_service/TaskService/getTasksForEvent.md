


# getTasksForEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getTasksForEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function is used to get all the tasks for the event.</p>
<p>params:</p>
<ul>
<li><code>eventId</code> : id of an event for which tasks need to fetched,</li>
</ul>



## Implementation

```dart
Future<void> getTasksForEvent(String eventId) async {
  await _databaseMutationFunctions
      .refreshAccessToken(_userConfig.currentUser.refreshToken!);
  final res = await _databaseMutationFunctions
      .gqlNonAuthQuery(TaskQueries.eventTasks(eventId));

  if (res != null) {
    _tasks.clear();
    final tasksList = res.data!['tasksByEvent'] as List;
    tasksList.forEach((task) {
      _tasks.add(Task.fromJson(task as Map<String, dynamic>));
    });
  }
}
```







