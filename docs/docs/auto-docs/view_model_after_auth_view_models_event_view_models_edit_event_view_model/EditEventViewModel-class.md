




EditEventViewModel class - edit\_event\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_event\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library.html)
3. EditEventViewModel class

EditEventViewModel


dark\_mode

light\_mode




# EditEventViewModel class


EditEventViewModel class have methods to interact with model in.

the context of editing the event in the organization.

Methods include:

* `updateEvent` : to update an event.

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* EditEventViewModel



## Constructors

[EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/EditEventViewModel.html)()




## Properties

[descriptionFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/descriptionFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the event description text input field.
getter/setter pair

[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventDescriptionTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController to handle the text input for the event description.
getter/setter pair

[eventEndDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndDate.html)
↔ DateTime

DateTime to store the selected end date for the event.
getter/setter pair

[eventEndTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndTime.html)
↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)

TimeOfDay to store the selected end time for the event.
getter/setter pair

[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventLocationTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController to handle the text input for the event location.
getter/setter pair

[eventStartDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartDate.html)
↔ DateTime

DateTime to store the selected start date for the event.
getter/setter pair

[eventStartTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartTime.html)
↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)

TimeOfDay to store the selected start time for the event.
getter/setter pair

[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventTitleTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController to handle the text input for the event title.
getter/setter pair

[formKey](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/formKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>

Form key for edit event.
final

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isPublicSwitch.html)
↔ bool

Boolean to indicate if the event is public or private. True means public.
getter/setter pair

[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isRegisterableSwitch.html)
↔ bool

Boolean to indicate if the event requires registration. True means registration is required.
getter/setter pair

[locationFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/locationFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the event location text input field.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[titleFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/titleFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the event title text input field.
getter/setter pair

[validate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/validate.html)
↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)

Validation flag.
getter/setter pair



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialize](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/initialize.html)([Event](../models_events_event_model/Event-class.html) event)
→ void


Method to initialize the event and fill the edit form.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateEvent](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/updateEvent.html)()
→ Future<void>


Updates an existing event with the data from the form.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_event\_view\_model](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library.html)
3. EditEventViewModel class

##### edit\_event\_view\_model library





talawa
1.0.0+1






