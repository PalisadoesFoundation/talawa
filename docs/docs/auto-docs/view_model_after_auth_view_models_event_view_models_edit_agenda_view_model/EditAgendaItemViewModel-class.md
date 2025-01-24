




EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. EditAgendaItemViewModel class

EditAgendaItemViewModel


dark\_mode

light\_mode




# EditAgendaItemViewModel class


a\_line\_ending\_with\_end\_punctuation.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* EditAgendaItemViewModel



## Constructors

[EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/EditAgendaItemViewModel.html)()




## Properties

[attachments](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/attachments.html)
→ List<String>

Get the list of attachments for the agenda item.
no setter

[categories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/categories.html)
→ List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>

Get the list of all available categories.
no setter

[descriptionController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/descriptionController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Controller for the description input field.
getter/setter pair

[durationController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/durationController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Controller for the duration input field.
getter/setter pair

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

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[selectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/selectedCategories.html)
→ List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>

Get the list of selected categories.
no setter

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[titleController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/titleController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Controller for the title input field.
getter/setter pair

[urlController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urlController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Controller for the URL input field.
getter/setter pair

[urls](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urls.html)
→ List<String>

Get the list of URLs for the agenda item.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[addUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/addUrl.html)(String url)
→ void


Adds a URL to the agenda item.

[checkForChanges](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/checkForChanges.html)()
→ bool


Checks if there are any unsaved changes in the form.

[dispose](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[initialize](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/initialize.html)([EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html) agendaItem, List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)> categories)
→ void


aInitializes the ViewModel with the provided agenda item and categories.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[pickAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/pickAttachment.html)({bool fromCamera = false})
→ Future<void>


Picks an attachment for the agenda item from the gallery or camera.

[removeAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeAttachment.html)(String image)
→ void


Removes an attachment from the agenda item.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[removeUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeUrl.html)(String url)
→ void


Removes a URL from the agenda item.

[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/setSelectedCategories.html)(List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)> categories)
→ void


Updates the selected categories in the form.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateAgendaItem](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/updateAgendaItem.html)()
→ Future<void>


Updates the agenda item with the modified values.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_agenda\_view\_model](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. EditAgendaItemViewModel class

##### edit\_agenda\_view\_model library





talawa
1.0.0+1






