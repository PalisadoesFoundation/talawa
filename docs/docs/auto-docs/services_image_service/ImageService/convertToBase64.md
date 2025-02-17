
<div>

# convertToBase64 method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
convertToBase64(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]
    file]

)



Converts the image into Base64 format.

**params**:

-   `file`: Image as a File object.

**returns**:

-   `Future<String>`: image in string format



## Implementation

``` language-dart
Future<String> convertToBase64(File file) async {
  try {
    final List<int> bytes = await file.;
    final String base64String = base64Encode(bytes);
    return base64String;
  } catch (error) {
    return '';
  }
}
```







1.  [talawa](../../index.html)
2.  [image_service](../../services_image_service/)
3.  [ImageService](../../services_image_service/ImageService-class.html)
4.  convertToBase64 method

##### ImageService class







