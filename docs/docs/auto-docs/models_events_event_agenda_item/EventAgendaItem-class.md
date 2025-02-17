::::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_agenda_item/models_events_event_agenda_item-library-sidebar.html" below-sidebar="models_events_event_agenda_item/EventAgendaItem-class-sidebar.html"}
<div>

# [EventAgendaItem]{.kind-class} class

</div>

::: {.section .desc .markdown}
Model for Event Agenda Item.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [title]{.parameter-name}, ]{#-param-title .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [description]{.parameter-name}, ]{#-param-description .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [duration]{.parameter-name}, ]{#-param-duration .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [attachments]{.parameter-name}, ]{#-param-attachments .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [createdBy]{.parameter-name}, ]{#-param-createdBy .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [urls]{.parameter-name}, ]{#-param-urls .parameter}[[[Event](../models_events_event_model/Event-class.html)?]{.type-annotation} [relatedEvent]{.parameter-name}, ]{#-param-relatedEvent .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [categories]{.parameter-name}, ]{#-param-categories .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation} [sequence]{.parameter-name}, ]{#-param-sequence .parameter}[[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation} [organization]{.parameter-name}]{#-param-organization .parameter}})]{.signature}

:   

[[EventAgendaItem.fromJson](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}]{#fromJson-param-json .parameter})]{.signature}

:   ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[attachments](../models_events_event_agenda_item/EventAgendaItem/attachments.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   Optional array of attachment URLs.
    ::: features
    [final]{.feature}
    :::

[[categories](../models_events_event_agenda_item/EventAgendaItem/categories.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   Optional array of agenda categories.
    ::: features
    [final]{.feature}
    :::

[[createdBy](../models_events_event_agenda_item/EventAgendaItem/createdBy.html)]{.name} [→ [User](../models_user_user_info/User-class.html)?]{.signature}
:   Reference to the user who created the agenda item.
    ::: features
    [final]{.feature}
    :::

[[description](../models_events_event_agenda_item/EventAgendaItem/description.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Optional description.
    ::: features
    [final]{.feature}
    :::

[[duration](../models_events_event_agenda_item/EventAgendaItem/duration.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Duration of the agenda item.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_events_event_agenda_item/EventAgendaItem/id.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Unique identifier for the agenda item.
    ::: features
    [final]{.feature}
    :::

[[organization](../models_events_event_agenda_item/EventAgendaItem/organization.html)]{.name} [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   Reference to the organization associated with the agenda item.
    ::: features
    [final]{.feature}
    :::

[[relatedEvent](../models_events_event_agenda_item/EventAgendaItem/relatedEvent.html)]{.name} [→ [Event](../models_events_event_model/Event-class.html)?]{.signature}
:   Reference to the event associated with the agenda item.
    ::: features
    [final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[sequence](../models_events_event_agenda_item/EventAgendaItem/sequence.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.signature}
:   Sequence number of the agenda item.
    ::: features
    [final]{.feature}
    :::

[[title](../models_events_event_agenda_item/EventAgendaItem/title.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Title of the agenda item.
    ::: features
    [final]{.feature}
    :::

[[urls](../models_events_event_agenda_item/EventAgendaItem/urls.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   Optional array of URLs related to the agenda item.
    ::: features
    [final]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor .inherited}
## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
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
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_agenda_item](../models_events_event_agenda_item/)
3.  EventAgendaItem class

##### event_agenda_item library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
