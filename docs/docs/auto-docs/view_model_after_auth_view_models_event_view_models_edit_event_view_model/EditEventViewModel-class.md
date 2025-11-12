<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  EditEventViewModel class

<div class="self-name">

EditEventViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class-sidebar.html">

<div>

# <span class="kind-class">EditEventViewModel</span> class

</div>

<div class="section desc markdown">

EditEventViewModel class have methods to interact with model in.

the context of editing the event in the organization.

Methods include:

- `updateEvent` : to update an event.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- EditEventViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/EditEventViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[descriptionFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/descriptionFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
FocusNode to manage focus for the event description text input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventDescriptionTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
TextEditingController to handle the text input for the event
description.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventEndDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
DateTime to store the selected end date for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventEndTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndTime.md)</span> <span class="signature">↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span>  
TimeOfDay to store the selected end time for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventLocationTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
TextEditingController to handle the text input for the event location.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventStartDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
DateTime to store the selected start date for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventStartTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartTime.md)</span> <span class="signature">↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span>  
TimeOfDay to store the selected start time for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventTitleTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
TextEditingController to handle the text input for the event title.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[formKey](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/formKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)</span>\></span></span>  
Form key for edit event.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isPublicSwitch.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Boolean to indicate if the event is public or private. True means
public.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isRegisterableSwitch.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Boolean to indicate if the event requires registration. True means
registration is required.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[locationFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/locationFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
FocusNode to manage focus for the event location text input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[titleFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/titleFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
FocusNode to manage focus for the event title text input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[validate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/validate.md)</span> <span class="signature">↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)</span>  
Validation flag.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[initialize](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/initialize.md)</span><span class="signature">(<span id="initialize-param-event" class="parameter"><span class="type-annotation">[Event](../models_events_event_model/Event-class.md)</span> <span class="parameter-name">event</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to initialize the event and fill the edit form.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateEvent](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/updateEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates an existing event with the data from the form.

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
2.  [edit_event_view_model](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  EditEventViewModel class

##### edit_event_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
