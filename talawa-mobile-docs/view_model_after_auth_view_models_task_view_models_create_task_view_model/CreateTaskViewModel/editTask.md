


# editTask method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> editTask
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId)





<p>This function updates the task.
The function uses <code>editTask</code> method provided by Task Services.</p>
<p>params:</p>
<ul>
<li><code>taskId</code> : id of the task that needs to be updated.</li>
</ul>



## Implementation

```dart
Future<bool> editTask(String taskId) async {
  final deadline = DateTime(
    taskEndDate.year,
    taskEndDate.month,
    taskEndDate.day,
    taskEndTime.hour,
    taskEndTime.minute,
  );
  return _taskService.editTask(
    title: taskTitleTextController.text,
    description: taskDescriptionTextController.text,
    deadline: deadline.microsecondsSinceEpoch.toString(),
    taskId: taskId,
  );
}
```







