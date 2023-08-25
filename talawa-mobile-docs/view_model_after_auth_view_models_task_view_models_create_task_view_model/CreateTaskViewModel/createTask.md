


# createTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> createTask
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function creates a new task for an event.
The function uses <code>createTask</code> method provided by Task Services.</p>
<p>params:</p>
<ul>
<li><code>eventId</code> : id of the event for which task need to be add.</li>
</ul>



## Implementation

```dart
Future<bool> createTask(String eventId) async {
  final deadline = DateTime(
    taskEndDate.year,
    taskEndDate.month,
    taskEndDate.day,
    taskEndTime.hour,
    taskEndTime.minute,
  );
  return _taskService.createTask(
    title: taskTitleTextController.text,
    description: taskDescriptionTextController.text,
    deadline: deadline.microsecondsSinceEpoch.toString(),
    eventId: eventId,
  );
}
```







