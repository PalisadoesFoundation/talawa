:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class-sidebar.html"}
<div>

# [EditEventViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
EditEventViewModel class have methods to interact with model in.

the context of editing the event in the organization.

Methods include:

-   `updateEvent` : to update an event.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EditEventViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/EditEventViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[descriptionFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/descriptionFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   FocusNode to manage focus for the event description text input
    field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventDescriptionTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   TextEditingController to handle the text input for the event
    description.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventEndDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   DateTime to store the selected end date for the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventEndTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventEndTime.html)]{.name} [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.signature}
:   TimeOfDay to store the selected end time for the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventLocationTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   TextEditingController to handle the text input for the event
    location.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventStartDate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   DateTime to store the selected start date for the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventStartTime](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventStartTime.html)]{.name} [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.signature}
:   TimeOfDay to store the selected start time for the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/eventTitleTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   TextEditingController to handle the text input for the event title.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[formKey](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/formKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Form key for edit event.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isPublicSwitch.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Boolean to indicate if the event is public or private. True means
    public.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/isRegisterableSwitch.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Boolean to indicate if the event requires registration. True means
    registration is required.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[locationFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/locationFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   FocusNode to manage focus for the event location text input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[titleFocus](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/titleFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   FocusNode to manage focus for the event title text input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[validate](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/validate.html)]{.name} [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]{.signature}
:   Validation flag.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/initialize.html)]{.name}[([[[Event](../models_events_event_model/Event-class.html)]{.type-annotation} [event]{.parameter-name}]{#initialize-param-event .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to initialize the event and fill the edit form.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateEvent](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel/updateEvent.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates an existing event with the data from the form.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [edit_event_view_model](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  EditEventViewModel class

##### edit_event_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
