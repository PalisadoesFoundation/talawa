<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [views/after_auth_screens/events/create_event_page.dart](../views_after_auth_screens_events_create_event_page/)
3.  CreateEventPageState class

<div class="self-name">

CreateEventPageState

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library-sidebar.html"
below-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html">

<div>

# <span class="kind-class">CreateEventPageState</span> class

</div>

<div class="section desc markdown">

\_CreateEventPageState returns a widget for a Page to Creatxe the Event
in the Organization.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.md)</span>\></span>
- CreateEventPageState

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[CreateEventPageState](../views_after_auth_screens_events_create_event_page/CreateEventPageState/CreateEventPageState.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[context](https://api.flutter.dev/flutter/widgets/State/context.html)</span> <span class="signature">→ [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)</span>  
The location in the tree where this widget builds.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[mounted](https://api.flutter.dev/flutter/widgets/State/mounted.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
is currently in a tree.

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

<span class="name">[selectedVenue](../views_after_auth_screens_events_create_event_page/CreateEventPageState/selectedVenue.md)</span> <span class="signature">↔ [Venue](../models_events_event_venue/Venue-class.md)?</span>  
venue selected by the user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)</span> <span class="signature">→ [CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.md)</span>  
The current configuration.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[activate](https://api.flutter.dev/flutter/widgets/State/activate.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called when this object is reinserted into the tree after having been
removed via
[deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[build](../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)</span><span class="signature">(<span id="build-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
Describes the part of the user interface represented by this widget.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[dateUpdater1](../views_after_auth_screens_events_create_event_page/CreateEventPageState/dateUpdater1.md)</span><span class="signature">(<span id="dateUpdater1-param-date" class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)</span> <span class="parameter-name">date</span>, </span><span id="dateUpdater1-param-model" class="parameter"><span class="type-annotation">[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ void</span> </span>  
Handles the selection and deselection of categories.

<span class="name">[dateUpdater2](../views_after_auth_screens_events_create_event_page/CreateEventPageState/dateUpdater2.md)</span><span class="signature">(<span id="dateUpdater2-param-date" class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)</span> <span class="parameter-name">date</span>, </span><span id="dateUpdater2-param-model" class="parameter"><span class="type-annotation">[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ void</span> </span>  
Handles the selection and deselection of categories.

<span class="name">[deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called when this object is removed from the tree.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugFillProperties](https://api.flutter.dev/flutter/widgets/State/debugFillProperties.html)</span><span class="signature">(<span id="debugFillProperties-param-properties" class="parameter"><span class="type-annotation">[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.md)</span> <span class="parameter-name">properties</span></span>) <span class="returntype parameter">→ void</span> </span>  
Add additional properties associated with the node.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called when a dependency of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html)</span><span class="signature">(<span id="didUpdateWidget-param-oldWidget" class="parameter">covariant <span class="type-annotation">[CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.md)</span> <span class="parameter-name">oldWidget</span></span>) <span class="returntype parameter">→ void</span> </span>  
Called whenever the widget configuration changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](https://api.flutter.dev/flutter/widgets/State/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called when this object is removed from the tree permanently.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[initState](https://api.flutter.dev/flutter/widgets/State/initState.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called when this object is inserted into the tree.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[reassemble](https://api.flutter.dev/flutter/widgets/State/reassemble.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Called whenever the application is reassembled during debugging, for
example during hot reload.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setState](https://api.flutter.dev/flutter/widgets/State/setState.html)</span><span class="signature">(<span id="setState-param-fn" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">fn</span></span>) <span class="returntype parameter">→ void</span> </span>  
Notify the framework that the internal state of this object has changed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[timeUpdater1](../views_after_auth_screens_events_create_event_page/CreateEventPageState/timeUpdater1.md)</span><span class="signature">(<span id="timeUpdater1-param-time" class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)</span> <span class="parameter-name">time</span>, </span><span id="timeUpdater1-param-model" class="parameter"><span class="type-annotation">[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ void</span> </span>  
Handles the selection and deselection of categories.

<span class="name">[timeUpdater2](../views_after_auth_screens_events_create_event_page/CreateEventPageState/timeUpdater2.md)</span><span class="signature">(<span id="timeUpdater2-param-time" class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)</span> <span class="parameter-name">time</span>, </span><span id="timeUpdater2-param-model" class="parameter"><span class="type-annotation">[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ void</span> </span>  
Handles the selection and deselection of categories.

<span class="name">[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/Diagnosticable/toDiagnosticsNode.html)</span><span class="signature"> <span class="returntype parameter">→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)</span> </span>  
Returns a debug representation of the object that is used by debugging
tools and by
[DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShort](https://api.flutter.dev/flutter/foundation/Diagnosticable/toStringShort.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A brief description of this object, usually just the
[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
and the
[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html).

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
2.  [create_event_page](../views_after_auth_screens_events_create_event_page/)
3.  CreateEventPageState class

##### create_event_page library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
