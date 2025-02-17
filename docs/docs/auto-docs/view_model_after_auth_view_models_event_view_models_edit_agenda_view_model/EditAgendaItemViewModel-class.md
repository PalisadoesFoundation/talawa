:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html"}
<div>

# [EditAgendaItemViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
a_line_ending_with_end_punctuation.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EditAgendaItemViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/EditAgendaItemViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[attachments](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/attachments.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Get the list of attachments for the agenda item.
    ::: features
    [no setter]{.feature}
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/categories.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Get the list of all available categories.
    ::: features
    [no setter]{.feature}
    :::

[[descriptionController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/descriptionController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Controller for the description input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[durationController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/durationController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Controller for the duration input field.
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/selectedCategories.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Get the list of selected categories.
    ::: features
    [no setter]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[titleController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/titleController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Controller for the title input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[urlController](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urlController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Controller for the URL input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[urls](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/urls.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Get the list of URLs for the agenda item.
    ::: features
    [no setter]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[addUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/addUrl.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [url]{.parameter-name}]{#addUrl-param-url .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Adds a URL to the agenda item.

[[checkForChanges](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/checkForChanges.html)]{.name}[() [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Checks if there are any unsaved changes in the form.

[[dispose](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[initialize](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/initialize.html)]{.name}[([[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)]{.type-annotation} [agendaItem]{.parameter-name}, ]{#initialize-param-agendaItem .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [categories]{.parameter-name}]{#initialize-param-categories .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   aInitializes the ViewModel with the provided agenda item and
    categories.

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

[[pickAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/pickAttachment.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [fromCamera]{.parameter-name} = [false]{.default-value}]{#pickAttachment-param-fromCamera .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Picks an attachment for the agenda item from the gallery or camera.

[[removeAttachment](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeAttachment.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [image]{.parameter-name}]{#removeAttachment-param-image .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Removes an attachment from the agenda item.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[removeUrl](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/removeUrl.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [url]{.parameter-name}]{#removeUrl-param-url .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Removes a URL from the agenda item.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/setSelectedCategories.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [categories]{.parameter-name}]{#setSelectedCategories-param-categories .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Updates the selected categories in the form.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateAgendaItem](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel/updateAgendaItem.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the agenda item with the modified values.
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
2.  [edit_agenda_view_model](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  EditAgendaItemViewModel class

##### edit_agenda_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
