



menu

1.  [talawa](../index.md)
2.  [models/events/event_model.dart](../models_events_event_model/)
3.  Event class


Event


 dark_mode   light_mode 




<div>

# Event class

</div>


This class creates an event model and returns an Event instance.




Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType/HiveType.html)(typeId:
        10)



## Constructors

[[Event](../models_events_event_model/Event/Event.md)][]

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

[[endAt](../models_events_event_model/Event/endAt.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   The end DateTime of the event.
    ::: features
    getter/setter pair
    :::

[[endDate](../models_events_event_model/Event/endDate.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Computed property: formatted end date (e.g. \"2025-07-31\").
    ::: features
    no setter
    :::

[[endTime](../models_events_event_model/Event/endTime.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Computed property: formatted end time (e.g. \"05:00 PM\").
    ::: features
    no setter
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

[[name](../models_events_event_model/Event/name.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The title of the event.
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

[[startAt](../models_events_event_model/Event/startAt.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
:   The start DateTime of the event.
    ::: features
    getter/setter pair
    :::

[[startDate](../models_events_event_model/Event/startDate.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Computed property: formatted start date (e.g. \"2025-07-30\").
    ::: features
    no setter
    :::

[[startTime](../models_events_event_model/Event/startTime.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Computed property: formatted start time (e.g. \"09:00 AM\").
    ::: features
    no setter
    :::



## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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









 talawa 1.0.0+1 
