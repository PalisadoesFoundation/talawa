:::::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/models_events_event_model-library-sidebar.html" below-sidebar="models_events_event_model/Event-class-sidebar.html"}
<div>

# [Event]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates an event model and returns an Event instance.
:::

::: section

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        10)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[Event](../models_events_event_model/Event/Event.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [title]{.parameter-name}, ]{#-param-title .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [description]{.parameter-name}, ]{#-param-description .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [attendees]{.parameter-name}, ]{#-param-attendees .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [location]{.parameter-name}, ]{#-param-location .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [recurring]{.parameter-name}, ]{#-param-recurring .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [allDay]{.parameter-name}, ]{#-param-allDay .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [startDate]{.parameter-name}, ]{#-param-startDate .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [endDate]{.parameter-name}, ]{#-param-endDate .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [startTime]{.parameter-name}, ]{#-param-startTime .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [endTime]{.parameter-name}, ]{#-param-endTime .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [isPublic]{.parameter-name}, ]{#-param-isPublic .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [isRegistered]{.parameter-name}, ]{#-param-isRegistered .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [isRegisterable]{.parameter-name}, ]{#-param-isRegisterable .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [creator]{.parameter-name}, ]{#-param-creator .parameter}[[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation} [organization]{.parameter-name}, ]{#-param-organization .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [admins]{.parameter-name}]{#-param-admins .parameter}})]{.signature}

:   

[[Event.fromJson](../models_events_event_model/Event/Event.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}]{#fromJson-param-json .parameter})]{.signature}

:   ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[admins](../models_events_event_model/Event/admins.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   The admins of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[allDay](../models_events_event_model/Event/allDay.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the event is an all-day event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[attendees](../models_events_event_model/Event/attendees.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   The attendees of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[creator](../models_events_event_model/Event/creator.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)?]{.signature}
:   The creator of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[description](../models_events_event_model/Event/description.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The description of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[endDate](../models_events_event_model/Event/endDate.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The end date of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[endTime](../models_events_event_model/Event/endTime.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The end time of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_events_event_model/Event/id.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Unique identifier for the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isPublic](../models_events_event_model/Event/isPublic.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the event is public.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isRegisterable](../models_events_event_model/Event/isRegisterable.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the event is registerable.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isRegistered](../models_events_event_model/Event/isRegistered.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the user is registered for the
    event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[location](../models_events_event_model/Event/location.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The location of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[organization](../models_events_event_model/Event/organization.html)]{.name} [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   The organization of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[recurring](../models_events_event_model/Event/recurring.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the event is recurring.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[startDate](../models_events_event_model/Event/startDate.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The start date of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[startTime](../models_events_event_model/Event/startTime.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The start time of the event.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[title](../models_events_event_model/Event/title.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The title of the event.
    ::: features
    [getter/setter pair]{.feature}
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
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_model](../models_events_event_model/)
3.  Event class

##### event_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
