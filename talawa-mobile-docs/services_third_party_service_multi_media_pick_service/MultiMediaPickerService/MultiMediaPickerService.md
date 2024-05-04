


# MultiMediaPickerService constructor







MultiMediaPickerService()





## Implementation

```dart
MultiMediaPickerService() {
  _picker = locator<ImagePicker>();
  _fileStream = _fileStreamController.stream.asBroadcastStream();
}
```







