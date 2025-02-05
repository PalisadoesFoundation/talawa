


# createTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> createTask
(\{required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId\})





<p>This function is used to create a new task for the event.</p>
<p>params:</p>
<ul>
<li>```darttitle``` : task title.</li>
<li>```dartdescription``` : task description.</li>
<li>```dartdeadline``` : task deadline.</li>
<li>```darteventId``` : Event for which task need to be create.</li>
</ul>



## Implementation

```dart
Future<bool> createTask(\{
  required String title,
  required String description,
  required String deadline,
  required String eventId,
\}) async \{
  _databaseMutationFunctions
      .refreshAccessToken(_userConfig.currentUser.refreshToken!);
  final res = await _databaseMutationFunctions.gqlAuthMutation(
    TaskQueries.addTask(
      title: title,
      description: description,
      deadline: deadline,
      eventId: eventId,
    ),
  );

  if (res != null) \{
    final task = res.data!['createTask'] as Map<String, dynamic>;
    _tasks.add(Task.fromJson(task));
    callbackNotifyListeners();
    return true;
  \}
  return false;
\}
```







