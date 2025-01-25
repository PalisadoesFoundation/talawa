




EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. EditAgendaItemViewModel class

EditAgendaItemViewModel


dark\_mode

light\_mode




# EditAgendaItemViewModel class


a\_line\_ending\_with\_end\_punctuation.


## Constructors

[EditAgendaItemViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/EditAgendaItemViewModel.html)()




## Properties

[attachments](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/attachments.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>

Get the list of attachments for the agenda item.
no setter

[categories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/categories.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Get the list of all available categories.
no setter

[descriptionController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/descriptionController.html)
↔ dynamic

Controller for the description input field.
getter/setter pair

[durationController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/durationController.html)
↔ dynamic

Controller for the duration input field.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[selectedCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/selectedCategories.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Get the list of selected categories.
no setter

[titleController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/titleController.html)
↔ dynamic

Controller for the title input field.
getter/setter pair

[urlController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urlController.html)
↔ dynamic

Controller for the URL input field.
getter/setter pair

[urls](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urls.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>

Get the list of URLs for the agenda item.
no setter



## Methods

[addUrl](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/addUrl.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) url)
→ void


Adds a URL to the agenda item.

[checkForChanges](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/checkForChanges.html)()
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


Checks if there are any unsaved changes in the form.

[dispose](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/dispose.html)()
→ void



[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/initialize.html)(dynamic agendaItem, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) categories)
→ void


aInitializes the ViewModel with the provided agenda item and categories.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[pickAttachment](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/pickAttachment.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromCamera = false})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Picks an attachment for the agenda item from the gallery or camera.

[removeAttachment](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeAttachment.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) image)
→ void


Removes an attachment from the agenda item.

[removeUrl](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeUrl.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) url)
→ void


Removes a URL from the agenda item.

[setSelectedCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/setSelectedCategories.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) categories)
→ void


Updates the selected categories in the form.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/updateAgendaItem.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the agenda item with the modified values.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_agenda\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. EditAgendaItemViewModel class

##### edit\_agenda\_view\_model library





talawa
1.0.0+1






