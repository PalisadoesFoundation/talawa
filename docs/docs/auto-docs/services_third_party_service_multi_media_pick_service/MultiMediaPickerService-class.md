


# MultiMediaPickerService class









<p>This is a third party service which provide the service to select the image from.</p>
<p>gallery and then image can be cropped as well.</p>
<p>Services include:</p>
<ul>
<li><code>getPhotoFromGallery</code> - Used to select photo from gallery.</li>
<li><code>cropImage</code> - Used to crop the selected image.</li>
</ul>




## Constructors

[MultiMediaPickerService](../services_third_party_service_multi_media_pick_service/MultiMediaPickerService/MultiMediaPickerService.md) ()

   


## Properties

##### [fileStream](../services_third_party_service_multi_media_pick_service/MultiMediaPickerService/fileStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)



This function returns the stream of files.  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [cropImage](../services_third_party_service_multi_media_pick_service/MultiMediaPickerService/cropImage.md)({required [File](https://api.flutter.dev/flutter/dart-io/File-class.html) imageFile}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?>



This function is used to crop the image selected by the user.  




##### [getPhotoFromGallery](../services_third_party_service_multi_media_pick_service/MultiMediaPickerService/getPhotoFromGallery.md)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?>



This function is used to pick the image from gallery or to click the image from user's camera.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















