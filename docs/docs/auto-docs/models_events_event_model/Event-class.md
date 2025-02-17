
<div>

# Event class

</div>


This class creates an event model and returns an Event instance.




Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        10)



## Constructors

[[Event](../models_events_event_model/Event/Event.md)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?] id, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] title, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] description, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.md)]\>]?] attendees, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] location, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] recurring, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] allDay, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] startDate, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] endDate, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] startTime, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] endTime, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] isPublic, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] isRegistered, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] isRegisterable, ][[[User](../models_user_user_info/User-class.md)?] creator, ][[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)?] organization, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.md)]\>]?] admins]})]

:   

[[Event.fromJson](../models_events_event_model/Event/Event.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]

:   ::: 
    factory
    :::



## Properties

[[admins](../models_events_event_model/Event/admins.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.md)]\>]?]
:   The admins of the event.
    ::: features
    getter/setter pair
    :::

[[allDay](../models_events_event_model/Event/allDay.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   A boolean value that indicates if the event is an all-day event.
    ::: features
    getter/setter pair
    :::

[[attendees](../models_events_event_model/Event/attendees.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.md)]\>]?]
:   The attendees of the event.
    ::: features
    getter/setter pair
    :::

[[creator](../models_events_event_model/Event/creator.md)] [↔ [User](../models_user_user_info/User-class.md)?]
:   The creator of the event.
    ::: features
    getter/setter pair
    :::

[[description](../models_events_event_model/Event/description.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The description of the event.
    ::: features
    getter/setter pair
    :::

[[endDate](../models_events_event_model/Event/endDate.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The end date of the event.
    ::: features
    getter/setter pair
    :::

[[endTime](../models_events_event_model/Event/endTime.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The end time of the event.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[id](../models_events_event_model/Event/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Unique identifier for the event.
    ::: features
    getter/setter pair
    :::

[[isPublic](../models_events_event_model/Event/isPublic.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   A boolean value that indicates if the event is public.
    ::: features
    getter/setter pair
    :::

[[isRegisterable](../models_events_event_model/Event/isRegisterable.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   A boolean value that indicates if the event is registerable.
    ::: features
    getter/setter pair
    :::

[[isRegistered](../models_events_event_model/Event/isRegistered.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   A boolean value that indicates if the user is registered for the
    event.
    ::: features
    getter/setter pair
    :::

[[location](../models_events_event_model/Event/location.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The location of the event.
    ::: features
    getter/setter pair
    :::

[[organization](../models_events_event_model/Event/organization.md)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?]
:   The organization of the event.
    ::: features
    getter/setter pair
    :::

[[recurring](../models_events_event_model/Event/recurring.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   A boolean value that indicates if the event is recurring.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[startDate](../models_events_event_model/Event/startDate.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The start date of the event.
    ::: features
    getter/setter pair
    :::

[[startTime](../models_events_event_model/Event/startTime.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The start time of the event.
    ::: features
    getter/setter pair
    :::

[[title](../models_events_event_model/Event/title.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The title of the event.
    ::: features
    getter/setter pair
    :::



## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [event_model](../models_events_event_model/)
3.  Event class

##### event_model library







