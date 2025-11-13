<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/caching/offline_action_queue.dart](../services_caching_offline_action_queue/)
3.  OfflineActionQueue class

<div class="self-name">

OfflineActionQueue

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_offline_action_queue/services_caching_offline_action_queue-library-sidebar.html"
below-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html">

<div>

# <span class="kind-class">OfflineActionQueue</span> class

</div>

<div class="section desc markdown">

OfflineActionQueue class manages a queue for offline actions.

This class provides the following functionalities:

- `initialize` : initializes the queue by registering adapters and
  opening the queue.
- `registerAdapters` : registers the required Hive adapters.
- `openQueue` : opens the Hive box for the offline action queue.
- `addAction` : adds an action to the queue with a TTL.
- `getActions` : retrieves all valid actions from the queue.
- `removeAction` : removes a specific action from the queue.
- `clearActions` : clears all actions from the queue.
- `removeExpiredActions` : removes expired actions from the queue.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[OfflineActionQueue.new](../services_caching_offline_action_queue/OfflineActionQueue/OfflineActionQueue.md)</span><span class="signature"></span>  

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

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addAction](../services_caching_offline_action_queue/OfflineActionQueue/addAction.md)</span><span class="signature">(<span id="addAction-param-action" class="parameter"><span class="type-annotation">[CachedUserAction](../models_caching_cached_user_action/CachedUserAction-class.md)</span> <span class="parameter-name">action</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Adds an action to the queue with a TTL.

<span class="name">[clearActions](../services_caching_offline_action_queue/OfflineActionQueue/clearActions.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Clears all actions from the queue.

<span class="name">[getActions](../services_caching_offline_action_queue/OfflineActionQueue/getActions.md)</span><span class="signature"> <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[CachedUserAction](../models_caching_cached_user_action/CachedUserAction-class.md)</span>\></span></span> </span>  
Retrieves all valid actions from the queue.

<span class="name">[initialize](../services_caching_offline_action_queue/OfflineActionQueue/initialize.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Initializes the queue by registering adapters and opening the queue.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[openQueue](../services_caching_offline_action_queue/OfflineActionQueue/openQueue.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Opens the Hive box for the offline action queue.

<span class="name">[removeAction](../services_caching_offline_action_queue/OfflineActionQueue/removeAction.md)</span><span class="signature">(<span id="removeAction-param-key" class="parameter"><span class="type-annotation">dynamic</span> <span class="parameter-name">key</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Removes a specific action from the queue.

<span class="name">[removeExpiredActions](../services_caching_offline_action_queue/OfflineActionQueue/removeExpiredActions.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Removes expired actions from the queue.

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

<div id="constants" class="section summary offset-anchor">

## Constants

<span class="name">[boxName](../services_caching_offline_action_queue/OfflineActionQueue/boxName-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Offline Action Queue box name.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [offline_action_queue](../services_caching_offline_action_queue/)
3.  OfflineActionQueue class

##### offline_action_queue library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
