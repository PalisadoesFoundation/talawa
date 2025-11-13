<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/attachments/attachment_model.dart](../models_attachments_attachment_model/models_attachments_attachment_model-library.md)
3.  AttachmentModel class

<div class="self-name">

AttachmentModel

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_attachments_attachment_model/models_attachments_attachment_model-library-sidebar.html"
below-sidebar="models_attachments_attachment_model/AttachmentModel-class-sidebar.html">

<div>

# <span class="kind-class">AttachmentModel</span> class

</div>

<div class="section desc markdown">

This class creates a model for attachments in posts. It includes fields
for the name, file hash, MIME type, and object name of the attachment.

</div>

<div class="section">

Annotations  
- @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
  8)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[AttachmentModel](../models_attachments_attachment_model/AttachmentModel/AttachmentModel.md)</span><span class="signature"></span>  

<span class="name">[AttachmentModel.fromJson](../models_attachments_attachment_model/AttachmentModel/AttachmentModel.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[fileHash](../models_attachments_attachment_model/AttachmentModel/fileHash.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Hash of the file.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[mimetype](../models_attachments_attachment_model/AttachmentModel/mimetype.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
MIME type of the attachment.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[name](../models_attachments_attachment_model/AttachmentModel/name.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Name of the attachment.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[objectName](../models_attachments_attachment_model/AttachmentModel/objectName.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Name of the object in the storage.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[url](../models_attachments_attachment_model/AttachmentModel/url.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Url of the attachment.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toJson](../models_attachments_attachment_model/AttachmentModel/toJson.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>\></span></span> </span>  
Converts the AttachmentModel instance to a JSON map.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [attachment_model](../models_attachments_attachment_model/models_attachments_attachment_model-library.md)
3.  AttachmentModel class

##### attachment_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
