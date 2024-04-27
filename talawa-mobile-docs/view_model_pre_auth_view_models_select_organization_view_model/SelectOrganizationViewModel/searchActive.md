


# searchActive method








void searchActive
()








## Implementation

```dart
void searchActive() {
  if (searchFocus.hasFocus) {
    organizations = [];
    searching = true;
    setState(ViewState.idle);
  }
}
```







