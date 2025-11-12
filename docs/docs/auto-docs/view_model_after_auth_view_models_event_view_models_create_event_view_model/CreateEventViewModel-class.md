<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/event_view_models/create_event_view_model.dart](../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  CreateEventViewModel class

<div class="self-name">

CreateEventViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html">

<div>

# <span class="kind-class">CreateEventViewModel</span> class

</div>

<div class="section desc markdown">

CreateEventViewModel class have methods to interact with model in.

the context of creating the event in the organization.

Methods include:

- `createEvent` : to create an event.
- `getImageFromGallery` : to select image for a post.
- `removeImage` : to remove the image.
- `getCurrentOrgUsersList` : to get all user list of current
  organization.
- `removeUserFromList` : to remove a user from list.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CreateEventViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[CreateEventViewModel.new](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/CreateEventViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[count](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/count.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
represents the count of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[descriptionFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/descriptionFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
DescriptionFocus FocusNode.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[endOccurenceController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/endOccurenceController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Event ends After n occurences controller.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventDescriptionTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Event Description Text Controller.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
Event End Date.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventEndTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndTime.md)</span> <span class="signature">↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span>  
Event End Time.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventEndType](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndType.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Event end type.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventLocationTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Event Location Text Controller.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
Event Start Date.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventStartTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartTime.md)</span> <span class="signature">↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span>  
Event Start Time.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventTitleTextController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Event Title Text Controller.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[formKey](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/formKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)</span>\></span></span>  
Global FormKey.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[frequency](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/frequency.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
represents the frequency of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

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

<span class="name">[imageFile](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/imageFile.md)</span> <span class="signature">→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?</span>  
Getter to return imageFile.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[interval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/interval.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
represents the interval of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isAllDay](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isAllDay.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
is an allday event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isPublicSwitch.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Public Event or Not.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isRecurring](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRecurring.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Is a recurring event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRegisterableSwitch.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
If event is registerable after creation.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[locationFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/locationFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
LocationFocus FocusNode.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/memberCheckedMap.md)</span> <span class="signature">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>  
Getter to return members map.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[orgMembersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/orgMembersList.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>  
Organisation Members List.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[recurrenceEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceEndDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
Event End Date for recurrence.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[recurrenceInterval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceInterval.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
RecurrenceRuleData frequency.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[recurrenceLabel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceLabel.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
represents the recurrence label.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[recurrenceStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceStartDate.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>  
Event Start Date for recurrence.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[repeatsEveryCountController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/repeatsEveryCountController.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Repeats Every count controller.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[selectedMembers](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/selectedMembers.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>  
Getter to return selected members.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[titleFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/titleFocus.md)</span> <span class="signature">↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
TitleFocus FocusNode.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[validate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/validate.md)</span> <span class="signature">↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)</span>  
AutoValidateMode default to disabled.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[weekDayOccurenceInMonth](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDayOccurenceInMonth.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
represents the week day occurence in Month.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[weekDays](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDays.md)</span> <span class="signature">↔ [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span>  
represents the week days of the event.

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

<span class="name">[buildUserList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/buildUserList.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function build the user list.

<span class="name">[createEvent](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/createEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function is used to create the event for the organization.

<span class="name">[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[fetchVenues](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/fetchVenues.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Venue](../models_events_event_venue/Venue-class.md)</span>\></span></span>\></span></span> </span>  
Fetches the list of venues registered to an organisation.

<span class="name">[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getCurrentOrgUsersList.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>\></span></span> </span>  
This function fetch all the users in the current organization and return
`List`.

<span class="name">[getImageFromGallery](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getImageFromGallery.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function is used to get the image from gallery.

<span class="name">[initialize](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/initialize.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Function To Initialize.

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

<span class="name">[removeImage](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeImage.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function remove the selected image.

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeUserFromList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeUserFromList.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function is used to remove a user from user's list.

<span class="name">[setEventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/setEventEndDate.md)</span><span class="signature">(<span id="setEventEndDate-param-selectedEndDate" class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)</span> <span class="parameter-name">selectedEndDate</span></span>) <span class="returntype parameter">→ void</span> </span>  
Updates the event end date to selected event end date.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
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

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [create_event_view_model](../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  CreateEventViewModel class

##### create_event_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
