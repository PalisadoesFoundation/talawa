


# fetchTasks method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchTasks
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function fetch all the task for an event.
The function uses <code>getTasksForEvent</code> method of Task Service.</p>
<p>params:</p>
<ul>
<li><code>eventId</code> : id of an event for which tasks need to be fetched.</li>
</ul>



## Implementation

```dart
Future<void> fetchTasks(String eventId) async {
  setState(ViewState.busy);
  await _taskService.getTasksForEvent(eventId);
  setState(ViewState.idle);
}
```







