:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html"}
<div>

# [CreateEventViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
CreateEventViewModel class have methods to interact with model in.

the context of creating the event in the organization.

Methods include:

-   `createEvent` : to create an event.
-   `getImageFromGallery` : to select image for a post.
-   `removeImage` : to remove the image.
-   `getCurrentOrgUsersList` : to get all user list of current
    organization.
-   `removeUserFromList` : to remove a user from list.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   CreateEventViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/CreateEventViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[count](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/count.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.signature}
:   represents the count of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[descriptionFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/descriptionFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   DescriptionFocus FocusNode.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[endOccurenceController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/endOccurenceController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Event ends After n occurences controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventDescriptionTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Event Description Text Controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   Event End Date.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventEndTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndTime.html)]{.name} [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.signature}
:   Event End Time.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventEndType](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndType.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   Event end type.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventLocationTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Event Location Text Controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   Event Start Date.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventStartTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartTime.html)]{.name} [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.signature}
:   Event Start Time.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventTitleTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Event Title Text Controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[formKey](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/formKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Global FormKey.
    ::: features
    [final]{.feature}
    :::

[[frequency](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/frequency.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   represents the frequency of the event.
    ::: features
    [getter/setter pair]{.feature}
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

[[imageFile](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/imageFile.html)]{.name} [→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.signature}
:   Getter to return imageFile.
    ::: features
    [no setter]{.feature}
    :::

[[interval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/interval.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   represents the interval of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isAllDay](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isAllDay.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   is an allday event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isPublicSwitch.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Public Event or Not.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isRecurring](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRecurring.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Is a recurring event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRegisterableSwitch.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   If event is registerable after creation.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[locationFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/locationFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   LocationFocus FocusNode.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/memberCheckedMap.html)]{.name} [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter to return members map.
    ::: features
    [no setter]{.feature}
    :::

[[orgMembersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/orgMembersList.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Organisation Members List.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[recurrenceEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceEndDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.signature}
:   Event End Date for recurrence.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[recurrenceInterval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceInterval.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   RecurrenceRuleData frequency.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[recurrenceLabel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceLabel.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   represents the recurrence label.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[recurrenceStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceStartDate.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   Event Start Date for recurrence.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[repeatsEveryCountController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/repeatsEveryCountController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Repeats Every count controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[selectedMembers](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/selectedMembers.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter to return selected members.
    ::: features
    [no setter]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[titleFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/titleFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   TitleFocus FocusNode.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[validate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/validate.html)]{.name} [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]{.signature}
:   AutoValidateMode default to disabled.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[weekDayOccurenceInMonth](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDayOccurenceInMonth.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.signature}
:   represents the week day occurence in Month.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[weekDays](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDays.html)]{.name} [↔ [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   represents the week days of the event.
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

[[buildUserList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/buildUserList.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function build the user list.

[[createEvent](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/createEvent.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to create the event for the organization.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchVenues](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/fetchVenues.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Venue](../models_events_event_venue/Venue-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches the list of venues registered to an organisation.

[[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getCurrentOrgUsersList.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function fetch all the users in the current organization and
    return `List`.

[[getImageFromGallery](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getImageFromGallery.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [camera]{.parameter-name} = [false]{.default-value}]{#getImageFromGallery-param-camera .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to get the image from gallery.

[[initialize](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/initialize.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Function To Initialize.

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

[[removeImage](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeImage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function remove the selected image.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[removeUserFromList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeUserFromList.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [userId]{.parameter-name}]{#removeUserFromList-param-userId .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   This function is used to remove a user from user\'s list.

[[setEventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/setEventEndDate.html)]{.name}[([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [selectedEndDate]{.parameter-name}]{#setEventEndDate-param-selectedEndDate .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Updates the event end date to selected event end date.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
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
2.  [create_event_view_model](../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  CreateEventViewModel class

##### create_event_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
