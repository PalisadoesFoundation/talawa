::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  EventInfoViewModel class

::: self-name
EventInfoViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html"}
<div>

# [EventInfoViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
EventInfoViewModel class helps interacting with model to serve view with
the event information data.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EventInfoViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[agendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of volunteer groups of an event.
    ::: features
    [no setter]{.feature}
    :::

[[attendees](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of Attendee type to store the attendees data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of Agenda categories in an organisation.
    ::: features
    [no setter]{.feature}
    :::

[[event](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.html)]{.name} [↔ [Event](../models_events_event_model/Event-class.html)]{.signature}
:   Event instance to store the event data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[exploreEventsInstance](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.html)]{.name} [↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)]{.signature}
:   ExploreEventsViewModel instance to fetch the event data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[fabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   String type variable to store the FAB title.
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

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of selected Agenda categories for an agenda item.
    ::: features
    [no setter]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[volunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of volunteer groups of an event.
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

[[createAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [title]{.parameter-name}, ]{#createAgendaItem-param-title .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [description]{.parameter-name}, ]{#createAgendaItem-param-description .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [duration]{.parameter-name}, ]{#createAgendaItem-param-duration .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [attachments]{.parameter-name}, ]{#createAgendaItem-param-attachments .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [urls]{.parameter-name}, ]{#createAgendaItem-param-urls .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [categories]{.parameter-name}, ]{#createAgendaItem-param-categories .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation} [sequence]{.parameter-name}]{#createAgendaItem-param-sequence .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)?]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to create a new agenda item for an event.

[[createVolunteerGroup](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.html)]{.name}[([[[Event](../models_events_event_model/Event-class.html)]{.type-annotation} [event]{.parameter-name}, ]{#createVolunteerGroup-param-event .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [groupName]{.parameter-name}, ]{#createVolunteerGroup-param-groupName .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [volunteersRequired]{.parameter-name}]{#createVolunteerGroup-param-volunteersRequired .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to create a new volunteer group for an event.

[[deleteAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [id]{.parameter-name}]{#deleteAgendaItem-param-id .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to delete an agenda item.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to fetch all agenda items of an organization.

[[fetchCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to fecth all agenda categories of an organisation.

[[fetchVolunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#fetchVolunteerGroups-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches all volunteer groups for the current event.

[[getFabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   The funtion returns title to be displayed on Floating Action Button.

[[initialize](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.html)]{.name}[({[required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [args]{.parameter-name}]{#initialize-param-args .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function initializes the EventInfoViewModel class with the
    required arguments.

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

[[registerForEvent](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   The function allows user to register for an event.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[reorderAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.html)]{.name}[([[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [oldIndex]{.parameter-name}, ]{#reorderAgendaItems-param-oldIndex .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [newIndex]{.parameter-name}]{#reorderAgendaItems-param-newIndex .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to redorder the sequence of agenda items.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [categories]{.parameter-name}]{#setSelectedCategories-param-categories .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   method to select multiple categories.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateAgendaItemSequence](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [itemId]{.parameter-name}, ]{#updateAgendaItemSequence-param-itemId .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [newSequence]{.parameter-name}]{#updateAgendaItemSequence-param-newSequence .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to update the sequence of an agenda item.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_info_view_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  EventInfoViewModel class

##### event_info_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
