


# fillTask method








void fillTask
([Task](../../models_task_task_model/Task-class.md) task)





<p>This functions fills the task controller data.</p>
<p>params:</p>
<ul>
<li><code>task</code> : <code>Task</code> type contain task data.</li>
</ul>



## Implementation

```dart
void fillTask(Task task) {
  taskTitleTextController.text = task.title;
  taskDescriptionTextController.text = task.description ?? '';
  if (task.deadline != null) {
    taskEndDate =
        DateTime.fromMicrosecondsSinceEpoch(int.parse(task.deadline!));
    taskEndTime = TimeOfDay.fromDateTime(taskEndDate);
  }
}
```







