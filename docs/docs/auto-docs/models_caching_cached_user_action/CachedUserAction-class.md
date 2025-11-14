<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [cached_user_action](../models_caching_cached_user_action/models_caching_cached_user_action-library.md)
3.  CachedUserAction class

<div class="self-name">

CachedUserAction

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_caching_cached_user_action/models_caching_cached_user_action-library-sidebar.html"
below-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html">

<div>

# <span class="kind-class">CachedUserAction</span> class

</div>

<div class="section desc markdown">

CachedUserAction class represents a user action that is cached for
offline use.

This class provides the following functionalities:

- `toJson` : converts a CachedUserAction to a JSON-compatible map.
- `fromJson` : creates a CachedUserAction from a JSON-compatible map.
- `execute` : executes the cached user action based on its operation
  type.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
- CachedUserAction

Annotations  
- @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
  3)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[CachedUserAction](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.md)</span><span class="signature">(<span id="-param-id" class="parameter"></span>)</span>  

<span class="name">[CachedUserAction.fromJson](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
Creates a CachedUserAction from a JSON-compatible map.

<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)</span> <span class="signature">→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?</span>  
Get the box in which this object is stored. Returns `null` if object has
not been added to a box yet.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[expiry](../models_caching_cached_user_action/CachedUserAction/expiry.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
The expiry date and time for the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_caching_cached_user_action/CachedUserAction/id.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
The unique identifier for the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Returns whether this object is currently stored in a box.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)</span> <span class="signature">→ dynamic</span>  
Get the key associated with this object. Returns `null` if object has
not been added to a box yet.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[metaData](../models_caching_cached_user_action/CachedUserAction/metaData.md)</span> <span class="signature">↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span>?</span>  
Any additional metadata related to the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[operation](../models_caching_cached_user_action/CachedUserAction/operation.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
The operation to be performed for the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[operationType](../models_caching_cached_user_action/CachedUserAction/operationType.md)</span> <span class="signature">↔ [CachedOperationType](../enums_enums/CachedOperationType.md)</span>  
The type of operation for the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[status](../models_caching_cached_user_action/CachedUserAction/status.md)</span> <span class="signature">↔ [CachedUserActionStatus](../enums_enums/CachedUserActionStatus.md)</span>  
The status of the cached user action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[timeStamp](../models_caching_cached_user_action/CachedUserAction/timeStamp.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
The timestamp when the action was cached.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[variables](../models_caching_cached_user_action/CachedUserAction/variables.md)</span> <span class="signature">↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span>?</span>  
The variables required for the operation, if any.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Deletes this object from the box it is stored in.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[execute](../models_caching_cached_user_action/CachedUserAction/execute.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
Executes the cached user action based on its operation type.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Persists this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toJson](../models_caching_cached_user_action/CachedUserAction/toJson.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Converts a CachedUserAction to a JSON-compatible map.

<span class="name">[toString](../models_caching_cached_user_action/CachedUserAction/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">override</span>

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
2.  [cached_user_action](../models_caching_cached_user_action/models_caching_cached_user_action-library.md)
3.  CachedUserAction class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
