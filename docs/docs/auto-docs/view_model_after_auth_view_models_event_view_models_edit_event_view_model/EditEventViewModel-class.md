
<div>

# EditEventViewModel class

</div>


EditEventViewModel class have methods to interact with model in.

the context of editing the event in the organization.

Methods include:

-   `updateEvent` : to update an event.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   EditEventViewModel



## Constructors

[EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/EditEventViewModel.md)

:   



## Properties

[[descriptionFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/descriptionFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the event description text input
    field.
    ::: features
    getter/setter pair
    :::

[[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventDescriptionTextController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController to handle the text input for the event
    description.
    ::: features
    getter/setter pair
    :::

[[eventEndDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndDate.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   DateTime to store the selected end date for the event.
    ::: features
    getter/setter pair
    :::

[[eventEndTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndTime.md)] [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
:   TimeOfDay to store the selected end time for the event.
    ::: features
    getter/setter pair
    :::

[[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventLocationTextController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController to handle the text input for the event
    location.
    ::: features
    getter/setter pair
    :::

[[eventStartDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartDate.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   DateTime to store the selected start date for the event.
    ::: features
    getter/setter pair
    :::

[[eventStartTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartTime.md)] [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
:   TimeOfDay to store the selected start time for the event.
    ::: features
    getter/setter pair
    :::

[[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventTitleTextController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController to handle the text input for the event title.
    ::: features
    getter/setter pair
    :::

[[formKey](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/formKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]\>]]
:   Form key for edit event.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isPublicSwitch.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Boolean to indicate if the event is public or private. True means
    public.
    ::: features
    getter/setter pair
    :::

[[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isRegisterableSwitch.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Boolean to indicate if the event requires registration. True means
    registration is required.
    ::: features
    getter/setter pair
    :::

[[locationFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/locationFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the event location text input field.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[titleFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/titleFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the event title text input field.
    ::: features
    getter/setter pair
    :::

[[validate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/validate.md)] [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]
:   Validation flag.
    ::: features
    getter/setter pair
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/initialize.md)][([[[Event](../models_events_event_model/Event-class.md)] event]) → void ]
:   Method to initialize the event and fill the edit form.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateEvent](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/updateEvent.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates an existing event with the data from the form.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [edit_event_view_model](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  EditEventViewModel class

##### edit_event_view_model library







