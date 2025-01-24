




convertToBase64 method - ImageService class - image\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/image\_service.dart](../../services_image_service/services_image_service-library.html)
3. [ImageService](../../services_image_service/ImageService-class.html)
4. convertToBase64 method

convertToBase64


dark\_mode

light\_mode




# convertToBase64 method


Future<String>
convertToBase64(

1. File file

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
2. [image\_service](../../services_image_service/services_image_service-library.html)
3. [ImageService](../../services_image_service/ImageService-class.html)
4. convertToBase64 method

##### ImageService class





talawa
1.0.0+1






