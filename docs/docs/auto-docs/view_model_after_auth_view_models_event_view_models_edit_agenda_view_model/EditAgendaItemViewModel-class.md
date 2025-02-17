
<div>

# EditAgendaItemViewModel class

</div>


a_line_ending_with_end_punctuation.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EditAgendaItemViewModel



## Constructors

[EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/EditAgendaItemViewModel.html)

:   



## Properties

[[attachments](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/attachments.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
:   Get the list of attachments for the agenda item.
    ::: features
    no setter
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/categories.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]]
:   Get the list of all available categories.
    ::: features
    no setter
    :::

[[descriptionController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/descriptionController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the description input field.
    ::: features
    getter/setter pair
    :::

[[durationController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/durationController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the duration input field.
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/selectedCategories.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]]
:   Get the list of selected categories.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::

[[titleController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/titleController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the title input field.
    ::: features
    getter/setter pair
    :::

[[urlController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urlController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the URL input field.
    ::: features
    getter/setter pair
    :::

[[urls](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urls.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
:   Get the list of URLs for the agenda item.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[addUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/addUrl.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] url]) → void ]
:   Adds a URL to the agenda item.

[[checkForChanges](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/checkForChanges.html)][() [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if there are any unsaved changes in the form.

[dispose](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/initialize.html)][([[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)] agendaItem, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]] categories]) → void ]
:   aInitializes the ViewModel with the provided agenda item and
    categories.

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

[[pickAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/pickAttachment.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] fromCamera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Picks an attachment for the agenda item from the gallery or camera.

[[removeAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeAttachment.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] image]) → void ]
:   Removes an attachment from the agenda item.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[removeUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeUrl.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] url]) → void ]
:   Removes a URL from the agenda item.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/setSelectedCategories.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]] categories]) → void ]
:   Updates the selected categories in the form.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAgendaItem](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/updateAgendaItem.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the agenda item with the modified values.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [edit_agenda_view_model](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  EditAgendaItemViewModel class

##### edit_agenda_view_model library







