


# setState method








void setState
([ViewState](../../enums_enums/ViewState.md) viewState)








## Implementation

```dart
void setState(ViewState viewState) {
  _state = viewState;
  notifyListeners();
}
```







