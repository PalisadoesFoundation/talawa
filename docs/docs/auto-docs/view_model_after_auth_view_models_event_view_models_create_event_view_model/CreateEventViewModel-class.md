
<div>

# CreateEventViewModel class

</div>


CreateEventViewModel class have methods to interact with model in.

the context of creating the event in the organization.

Methods include:

-   `createEvent` : to create an event.
-   `getImageFromGallery` : to select image for a post.
-   `removeImage` : to remove the image.
-   `getCurrentOrgUsersList` : to get all user list of current
    organization.
-   `removeUserFromList` : to remove a user from list.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   CreateEventViewModel



## Constructors

[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/CreateEventViewModel.html)

:   



## Properties

[[count](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/count.html)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   represents the count of the event.
    ::: features
    getter/setter pair
    :::

[[descriptionFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/descriptionFocus.html)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   DescriptionFocus FocusNode.
    ::: features
    getter/setter pair
    :::

[[endOccurenceController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/endOccurenceController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Event ends After n occurences controller.
    ::: features
    getter/setter pair
    :::

[[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventDescriptionTextController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Event Description Text Controller.
    ::: features
    getter/setter pair
    :::

[[eventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndDate.html)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   Event End Date.
    ::: features
    getter/setter pair
    :::

[[eventEndTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndTime.html)] [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
:   Event End Time.
    ::: features
    getter/setter pair
    :::

[[eventEndType](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndType.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Event end type.
    ::: features
    getter/setter pair
    :::

[[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventLocationTextController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Event Location Text Controller.
    ::: features
    getter/setter pair
    :::

[[eventStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartDate.html)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   Event Start Date.
    ::: features
    getter/setter pair
    :::

[[eventStartTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartTime.html)] [↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
:   Event Start Time.
    ::: features
    getter/setter pair
    :::

[[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventTitleTextController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Event Title Text Controller.
    ::: features
    getter/setter pair
    :::

[[formKey](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/formKey.html)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]\>]]
:   Global FormKey.
    ::: features
    final
    :::

[[frequency](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/frequency.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   represents the frequency of the event.
    ::: features
    getter/setter pair
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

[[imageFile](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/imageFile.html)] [→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]
:   Getter to return imageFile.
    ::: features
    no setter
    :::

[[interval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/interval.html)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   represents the interval of the event.
    ::: features
    getter/setter pair
    :::

[[isAllDay](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isAllDay.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   is an allday event.
    ::: features
    getter/setter pair
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isPublicSwitch.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Public Event or Not.
    ::: features
    getter/setter pair
    :::

[[isRecurring](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRecurring.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Is a recurring event.
    ::: features
    getter/setter pair
    :::

[[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRegisterableSwitch.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   If event is registerable after creation.
    ::: features
    getter/setter pair
    :::

[[locationFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/locationFocus.html)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   LocationFocus FocusNode.
    ::: features
    getter/setter pair
    :::

[[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/memberCheckedMap.html)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
:   Getter to return members map.
    ::: features
    no setter
    :::

[[orgMembersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/orgMembersList.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]\>]]
:   Organisation Members List.
    ::: features
    getter/setter pair
    :::

[[recurrenceEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceEndDate.html)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   Event End Date for recurrence.
    ::: features
    getter/setter pair
    :::

[[recurrenceInterval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceInterval.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   RecurrenceRuleData frequency.
    ::: features
    getter/setter pair
    :::

[[recurrenceLabel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceLabel.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   represents the recurrence label.
    ::: features
    getter/setter pair
    :::

[[recurrenceStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceStartDate.html)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   Event Start Date for recurrence.
    ::: features
    getter/setter pair
    :::

[[repeatsEveryCountController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/repeatsEveryCountController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Repeats Every count controller.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedMembers](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/selectedMembers.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]\>]]
:   Getter to return selected members.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::

[[titleFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/titleFocus.html)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   TitleFocus FocusNode.
    ::: features
    getter/setter pair
    :::

[[validate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/validate.html)] [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]
:   AutoValidateMode default to disabled.
    ::: features
    getter/setter pair
    :::

[[weekDayOccurenceInMonth](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDayOccurenceInMonth.html)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   represents the week day occurence in Month.
    ::: features
    getter/setter pair
    :::

[[weekDays](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDays.html)] [↔ [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
:   represents the week days of the event.
    ::: features
    getter/setter pair
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[buildUserList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/buildUserList.html) [→ void ]
:   This function build the user list.

[[createEvent](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/createEvent.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to create the event for the organization.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[fetchVenues](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/fetchVenues.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Venue](../models_events_event_venue/Venue-class.html)]\>]]\>]] ]
:   Fetches the list of venues registered to an organisation.

[[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getCurrentOrgUsersList.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]\>]]\>]] ]
:   This function fetch all the users in the current organization and
    return `List`.

[[getImageFromGallery](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getImageFromGallery.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] camera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get the image from gallery.

[initialize](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/initialize.html) [→ void ]
:   Function To Initialize.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[removeImage](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeImage.html) [→ void ]
:   This function remove the selected image.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[removeUserFromList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeUserFromList.html)][({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] userId]}) → void ]
:   This function is used to remove a user from user\'s list.

[[setEventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/setEventEndDate.html)][([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)] selectedEndDate]) → void ]
:   Updates the event end date to selected event end date.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [create_event_view_model](../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  CreateEventViewModel class

##### create_event_view_model library







