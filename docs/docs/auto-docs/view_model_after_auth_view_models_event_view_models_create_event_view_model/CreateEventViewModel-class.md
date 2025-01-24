




CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. CreateEventViewModel class

CreateEventViewModel


dark\_mode

light\_mode




# CreateEventViewModel class


CreateEventViewModel class have methods to interact with model in.

the context of creating the event in the organization.

Methods include:

* `createEvent` : to create an event.
* `getImageFromGallery` : to select image for a post.
* `removeImage` : to remove the image.
* `getCurrentOrgUsersList` : to get all user list of current organization.
* `removeUserFromList` : to remove a user from list.

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* CreateEventViewModel



## Constructors

[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/CreateEventViewModel.html)()




## Properties

[count](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/count.html)
↔ int?

represents the count of the event.
getter/setter pair

[descriptionFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/descriptionFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

DescriptionFocus FocusNode.
getter/setter pair

[endOccurenceController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/endOccurenceController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Event ends After n occurences controller.
getter/setter pair

[eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventDescriptionTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Event Description Text Controller.
getter/setter pair

[eventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndDate.html)
↔ DateTime

Event End Date.
getter/setter pair

[eventEndTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndTime.html)
↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)

Event End Time.
getter/setter pair

[eventEndType](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndType.html)
↔ String

Event end type.
getter/setter pair

[eventLocationTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventLocationTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Event Location Text Controller.
getter/setter pair

[eventStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartDate.html)
↔ DateTime

Event Start Date.
getter/setter pair

[eventStartTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartTime.html)
↔ [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)

Event Start Time.
getter/setter pair

[eventTitleTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventTitleTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Event Title Text Controller.
getter/setter pair

[formKey](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/formKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>

Global FormKey.
final

[frequency](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/frequency.html)
↔ String

represents the frequency of the event.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[imageFile](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/imageFile.html)
→ File?

Getter to return imageFile.
no setter

[interval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/interval.html)
↔ int

represents the interval of the event.
getter/setter pair

[isAllDay](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isAllDay.html)
↔ bool

is an allday event.
getter/setter pair

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isPublicSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isPublicSwitch.html)
↔ bool

Public Event or Not.
getter/setter pair

[isRecurring](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRecurring.html)
↔ bool

Is a recurring event.
getter/setter pair

[isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRegisterableSwitch.html)
↔ bool

If event is registerable after creation.
getter/setter pair

[locationFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/locationFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

LocationFocus FocusNode.
getter/setter pair

[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/memberCheckedMap.html)
→ Map<String, bool>

Getter to return members map.
no setter

[orgMembersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/orgMembersList.html)
↔ List<[User](../models_user_user_info/User-class.html)>

Organisation Members List.
getter/setter pair

[recurrenceEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceEndDate.html)
↔ DateTime?

Event End Date for recurrence.
getter/setter pair

[recurrenceInterval](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceInterval.html)
↔ String

RecurrenceRuleData frequency.
getter/setter pair

[recurrenceLabel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceLabel.html)
↔ String

represents the recurrence label.
getter/setter pair

[recurrenceStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/recurrenceStartDate.html)
↔ DateTime

Event Start Date for recurrence.
getter/setter pair

[repeatsEveryCountController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/repeatsEveryCountController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Repeats Every count controller.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[selectedMembers](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/selectedMembers.html)
→ List<[User](../models_user_user_info/User-class.html)>

Getter to return selected members.
no setter

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[titleFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/titleFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

TitleFocus FocusNode.
getter/setter pair

[validate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/validate.html)
↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)

AutoValidateMode default to disabled.
getter/setter pair

[weekDayOccurenceInMonth](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDayOccurenceInMonth.html)
↔ int?

represents the week day occurence in Month.
getter/setter pair

[weekDays](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/weekDays.html)
↔ Set<String>

represents the week days of the event.
getter/setter pair



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[buildUserList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/buildUserList.html)()
→ void


This function build the user list.

[createEvent](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/createEvent.html)()
→ Future<void>


This function is used to create the event for the organization.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[fetchVenues](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/fetchVenues.html)()
→ Future<List<[Venue](../models_events_event_venue/Venue-class.html)>>


Fetches the list of venues registered to an organisation.

[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getCurrentOrgUsersList.html)()
→ Future<List<[User](../models_user_user_info/User-class.html)>>


This function fetch all the users in the current organization and return `List`.

[getImageFromGallery](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getImageFromGallery.html)({bool camera = false})
→ Future<void>


This function is used to get the image from gallery.

[initialize](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/initialize.html)()
→ void


Function To Initialize.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeImage](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeImage.html)()
→ void


This function remove the selected image.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[removeUserFromList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeUserFromList.html)({required String userId})
→ void


This function is used to remove a user from user's list.

[setEventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/setEventEndDate.html)(DateTime selectedEndDate)
→ void


Updates the event end date to selected event end date.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [create\_event\_view\_model](../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. CreateEventViewModel class

##### create\_event\_view\_model library





talawa
1.0.0+1






