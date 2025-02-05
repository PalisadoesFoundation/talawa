


# ExploreTasksViewModel constructor







ExploreTasksViewModel()





## Implementation

```dart
ExploreTasksViewModel() {
  _taskService.callbackNotifyListeners = () => notifyListeners();
}
```







