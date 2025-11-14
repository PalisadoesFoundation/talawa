<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [views/after_auth_screens/events/event_calendar.dart](../views_after_auth_screens_events_event_calendar/)
3.  EventCalendar class

<div class="self-name">

EventCalendar

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_event_calendar/views_after_auth_screens_events_event_calendar-library-sidebar.html"
below-sidebar="views_after_auth_screens_events_event_calendar/EventCalendar-class-sidebar.html">

<div>

# <span class="kind-class">EventCalendar</span> class

</div>

<div class="section desc markdown">

EventCalendar returns a widget that has mutable state
\_EventCalendarState.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
- [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
- [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- EventCalendar

Available extensions  
- [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/AnimateWidgetExtensions.html)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventCalendar.new](../views_after_auth_screens_events_event_calendar/EventCalendar/EventCalendar.md)</span><span class="signature">(<span id="-param-eventList" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span> <span class="parameter-name">eventList</span>, )</span>  
<div class="constructor-modifier features">

const

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[eventList](../views_after_auth_screens_events_event_calendar/EventCalendar/eventList.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>  
List of events that needs to bge passed when the calling this widget.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)</span> <span class="signature">→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?</span>  
Controls how one widget replaces another widget in the tree.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

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

<span class="name">[animate](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/AnimateWidgetExtensions/animate.html)</span><span class="signature"> <span class="returntype parameter">→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/Animate-class.html)</span> </span>  
Available on
[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html),
provided by the
[AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/AnimateWidgetExtensions.html)
extension

Wraps the target
[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) in
an
[Animate](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/Animate-class.html)
instance, and returns the instance for chaining calls. Ex.
`myWidget.` is equivalent to `Animate(child: myWidget)`.

<span class="name">[build](../views_after_auth_screens_events_event_calendar/EventCalendar/build.md)</span><span class="signature">(<span id="build-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
Describes the part of the user interface represented by this widget.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[calendarViewSelection](../views_after_auth_screens_events_event_calendar/EventCalendar/calendarViewSelection.md)</span><span class="signature">(<span id="calendarViewSelection-param-model" class="parameter"><span class="type-annotation">[EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ [PopupMenuButton](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span> </span>  
Popupmenu Button to select calendar view.

<span class="name">[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)</span><span class="signature"> <span class="returntype parameter">→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)</span> </span>  
Creates a
[StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
to manage this widget's location in the tree.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)</span><span class="signature"> <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)</span>\></span></span> </span>  
Returns a list of
[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)
objects describing this node's children.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)</span><span class="signature">(<span id="debugFillProperties-param-properties" class="parameter"><span class="type-annotation">[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.md)</span> <span class="parameter-name">properties</span></span>) <span class="returntype parameter">→ void</span> </span>  
Add additional properties associated with the node.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)</span><span class="signature"> <span class="returntype parameter">→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)</span> </span>  
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

<span class="name">[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a string representation of this node and its descendants.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a one-line detailed description of the object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A short, textual description of this widget.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
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
2.  [event_calendar](../views_after_auth_screens_events_event_calendar/)
3.  EventCalendar class

##### event_calendar library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
