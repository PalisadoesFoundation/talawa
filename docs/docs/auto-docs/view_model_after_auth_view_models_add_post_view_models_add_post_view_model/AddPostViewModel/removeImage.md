


# removeImage method








void removeImage
()





<p>This function removes the image selected.</p>
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







