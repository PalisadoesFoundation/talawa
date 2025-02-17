::::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_volunteer/models_events_event_volunteer-library-sidebar.html" below-sidebar="models_events_event_volunteer/EventVolunteer-class-sidebar.html"}
<div>

# [EventVolunteer]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates an event volunteer model and returns an
EventVolunteer instance.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventVolunteer](../models_events_event_volunteer/EventVolunteer/EventVolunteer.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [creator]{.parameter-name}, ]{#-param-creator .parameter}[[[Event](../models_events_event_model/Event-class.html)?]{.type-annotation} [event]{.parameter-name}, ]{#-param-event .parameter}[[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]{.type-annotation} [group]{.parameter-name}, ]{#-param-group .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [isAssigned]{.parameter-name}, ]{#-param-isAssigned .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [isInvited]{.parameter-name}, ]{#-param-isInvited .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [response]{.parameter-name}, ]{#-param-response .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [user]{.parameter-name}]{#-param-user .parameter}})]{.signature}

:   

[[EventVolunteer.fromJson](../models_events_event_volunteer/EventVolunteer/EventVolunteer.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}]{#fromJson-param-json .parameter})]{.signature}

:   ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[createdAt](../models_events_event_volunteer/EventVolunteer/createdAt.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The creation date of the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[creator](../models_events_event_volunteer/EventVolunteer/creator.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)?]{.signature}
:   The creator of the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[event](../models_events_event_volunteer/EventVolunteer/event.html)]{.name} [↔ [Event](../models_events_event_model/Event-class.html)?]{.signature}
:   The event associated with the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[group](../models_events_event_volunteer/EventVolunteer/group.html)]{.name} [↔ [EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]{.signature}
:   The group associated with the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_events_event_volunteer/EventVolunteer/id.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Unique identifier for the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isAssigned](../models_events_event_volunteer/EventVolunteer/isAssigned.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the volunteer is assigned.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isInvited](../models_events_event_volunteer/EventVolunteer/isInvited.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   A boolean value that indicates if the volunteer is invited.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[response](../models_events_event_volunteer/EventVolunteer/response.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The response of the volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[updatedAt](../models_events_event_volunteer/EventVolunteer/updatedAt.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The last update date of the event volunteer.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[user](../models_events_event_volunteer/EventVolunteer/user.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)?]{.signature}
:   The user who is the volunteer.
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
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_volunteer](../models_events_event_volunteer/)
3.  EventVolunteer class

##### event_volunteer library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
