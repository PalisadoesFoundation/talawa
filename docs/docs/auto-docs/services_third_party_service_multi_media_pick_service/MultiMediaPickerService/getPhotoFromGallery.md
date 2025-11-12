



menu

1.  [talawa](../../index.md)
2.  [services/third_party_service/multi_media_pick_service.dart](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.md)
4.  getPhotoFromGallery method


getPhotoFromGallery


 dark_mode   light_mode 




<div>

# getPhotoFromGallery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]\>]]




Picks the image from gallery or to click the image from user\'s camera.

First ask for the permission to access the camera, if denied then
returns a message in. custom Dialog Box. Returns a File type for which
`camera` variable is false by default.

**params**:

-   `camera`: if true then open camera for image, else open gallery to
    select image.

**returns**:

-   `Future<File?>`: the image the user choosed.



## Implementation

``` language-dart
Future<File?>  async 
```







1.  [talawa](../../index.md)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.md)
4.  getPhotoFromGallery method

##### MultiMediaPickerService class









 talawa 1.0.0+1 
