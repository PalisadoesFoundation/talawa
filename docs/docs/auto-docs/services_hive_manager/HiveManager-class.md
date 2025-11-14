<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [hive_manager](../services_hive_manager/services_hive_manager-library.md)
3.  HiveManager class

<div class="self-name">

HiveManager

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_hive_manager/services_hive_manager-library-sidebar.html"
below-sidebar="services_hive_manager/HiveManager-class-sidebar.html">

<div>

# <span class="kind-class">HiveManager</span> class

</div>

<div class="section desc markdown">

A manager class responsible for initializing and tearing down Hive, a
local database for Flutter.

The `HiveManager` class provides methods to initialize Hive with
necessary adapters and open boxes for various models used throughout the
application. It also provides a method to close all opened Hive boxes
when they are no longer needed.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[HiveManager](../services_hive_manager/HiveManager/HiveManager.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods"
class="section summary offset-anchor inherited">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

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

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[closeBox](../services_hive_manager/HiveManager/closeBox.md)</span><span class="signature">\<<span class="type-parameter">T</span>\></span><span class="signature">(<span id="closeBox-param-boxName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">boxName</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Closes the `boxName` named box.

<span class="name">[initializeHive](../services_hive_manager/HiveManager/initializeHive.md)</span><span class="signature">(<span id="initializeHive-param-dir" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Initializes Hive with the specified directory.

<span class="name">[openBox](../services_hive_manager/HiveManager/openBox.md)</span><span class="signature">\<<span class="type-parameter">T</span>\></span><span class="signature">(<span id="openBox-param-boxName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">boxName</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Opens the `boxName` named box.

<span class="name">[registerAdapter](../services_hive_manager/HiveManager/registerAdapter.md)</span><span class="signature">\<<span class="type-parameter">T</span>\></span><span class="signature">(<span id="registerAdapter-param-adapter" class="parameter"><span class="type-annotation">[TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.md)<span class="signature">\<<span class="type-parameter">T</span>\></span></span> <span class="parameter-name">adapter</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Registers the `adapter` named adapter.

<span class="name">[registerAdapters](../services_hive_manager/HiveManager/registerAdapters.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Registers the necessary Hive adapters for the models used in the
application.

<span class="name">[teardownHive](../services_hive_manager/HiveManager/teardownHive.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Closes all opened Hive boxes and the Hive instance itself.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [hive_manager](../services_hive_manager/services_hive_manager-library.md)
3.  HiveManager class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
