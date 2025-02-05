


# saveUserInHive method








void saveUserInHive
()








## Implementation

```dart
void saveUserInHive() {
  final box = Hive.box<User>('currentUser');
  if (box.get('user') == null) {
    box.put('user', _currentUser!);
  } else {
    box.put('user', _currentUser!);
  }
}
```







