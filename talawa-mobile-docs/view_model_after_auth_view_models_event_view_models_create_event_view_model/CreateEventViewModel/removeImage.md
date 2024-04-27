


# removeImage method








void removeImage
()





<p>This function remove the selected image.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void removeImage() {
  _imageFile = null;
  notifyListeners();
}
```







