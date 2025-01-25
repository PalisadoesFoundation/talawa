




EditEventViewModel class - edit\_event\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_event\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3. EditEventViewModel class

EditEventViewModel


dark\_mode

light\_mode




# EditEventViewModel class


EditEventViewModel class have methods to interact with model in.

the context of editing the event in the organization.

Methods include:

* `updateEvent` : to update an event.

## Constructors

[EditEventViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/EditEventViewModel.html)()




## Properties

[descriptionFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/descriptionFocus.html)
↔ dynamic

FocusNode to manage focus for the event description text input field.
getter/setter pair

[eventDescriptionTextController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventDescriptionTextController.html)
↔ dynamic

TextEditingController to handle the text input for the event description.
getter/setter pair

[eventEndDate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndDate.html)
↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

DateTime to store the selected end date for the event.
getter/setter pair

[eventEndTime](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndTime.html)
↔ dynamic

TimeOfDay to store the selected end time for the event.
getter/setter pair

[eventLocationTextController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventLocationTextController.html)
↔ dynamic

TextEditingController to handle the text input for the event location.
getter/setter pair

[eventStartDate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartDate.html)
↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

DateTime to store the selected start date for the event.
getter/setter pair

[eventStartTime](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartTime.html)
↔ dynamic

TimeOfDay to store the selected start time for the event.
getter/setter pair

[eventTitleTextController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventTitleTextController.html)
↔ dynamic

TextEditingController to handle the text input for the event title.
getter/setter pair

[formKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/formKey.html)
→ dynamic

Form key for edit event.
final

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[isPublicSwitch](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isPublicSwitch.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Boolean to indicate if the event is public or private. True means public.
getter/setter pair

[isRegisterableSwitch](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isRegisterableSwitch.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Boolean to indicate if the event requires registration. True means registration is required.
getter/setter pair

[locationFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/locationFocus.html)
↔ dynamic

FocusNode to manage focus for the event location text input field.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[titleFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/titleFocus.html)
↔ dynamic

FocusNode to manage focus for the event title text input field.
getter/setter pair

[validate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/validate.html)
↔ dynamic

Validation flag.
getter/setter pair



## Methods

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/initialize.html)(dynamic event)
→ void


Method to initialize the event and fill the edit form.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/updateEvent.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates an existing event with the data from the form.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_event\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3. EditEventViewModel class

##### edit\_event\_view\_model library





talawa
1.0.0+1






