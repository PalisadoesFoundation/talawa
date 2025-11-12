



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  EditAgendaItemViewModel class


EditAgendaItemViewModel


 dark_mode   light_mode 




<div>

# EditAgendaItemViewModel class

</div>


a_line_ending_with_end_punctuation.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   EditAgendaItemViewModel



## Constructors

[EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/EditAgendaItemViewModel.md)

:   



## Properties

[[attachments](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/attachments.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
:   Get the list of attachments for the agenda item.
    ::: features
    no setter
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/categories.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]]
:   Get the list of all available categories.
    ::: features
    no setter
    :::

[[descriptionController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/descriptionController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the description input field.
    ::: features
    getter/setter pair
    :::

[[durationController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/durationController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/selectedCategories.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]]
:   Get the list of selected categories.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[titleController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/titleController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the title input field.
    ::: features
    getter/setter pair
    :::

[[urlController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urlController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Controller for the URL input field.
    ::: features
    getter/setter pair
    :::

[[urls](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urls.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
:   Get the list of URLs for the agenda item.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[addUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/addUrl.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] url]) → void ]
:   Adds a URL to the agenda item.

[[checkForChanges](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/checkForChanges.md)][ [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if there are any unsaved changes in the form.

[dispose](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/initialize.md)][([[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.md)] agendaItem, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]] categories]) → void ]
:   aInitializes the ViewModel with the provided agenda item and
    categories.

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

[[pickAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/pickAttachment.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Picks an attachment for the agenda item from the gallery or camera.

[[removeAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeAttachment.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] image]) → void ]
:   Removes an attachment from the agenda item.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[removeUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeUrl.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] url]) → void ]
:   Removes a URL from the agenda item.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/setSelectedCategories.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]] categories]) → void ]
:   Updates the selected categories in the form.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAgendaItem](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/updateAgendaItem.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the agenda item with the modified values.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [edit_agenda_view_model](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  EditAgendaItemViewModel class

##### edit_agenda_view_model library









 talawa 1.0.0+1 
