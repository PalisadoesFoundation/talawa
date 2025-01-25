




convertToBase64 method - ImageService class - image\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/image\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_image_service/)
3. [ImageService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_image_service/ImageService-class.html)
4. convertToBase64 method

convertToBase64


dark\_mode

light\_mode




# convertToBase64 method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>
convertToBase64(

1. [File](https://api.flutter.dev/flutter/dart-io/File-class.html) file

)

Converts the image into Base64 format.

**params**:

* `file`: Image as a File object.

**returns**:

* `Future<String>`: image in string format

## Implementation

```
Future<String> convertToBase64(File file) async {
  try {
    final List<int> bytes = await file.readAsBytes();
    final String base64String = base64Encode(bytes);
    return base64String;
  } catch (error) {
    return '';
  }
}
```

 


1. [talawa](../../index.html)
2. [image\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_image_service/)
3. [ImageService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_image_service/ImageService-class.html)
4. convertToBase64 method

##### ImageService class





talawa
1.0.0+1






