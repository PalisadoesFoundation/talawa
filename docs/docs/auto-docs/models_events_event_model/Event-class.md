




Event class - event\_model library - Dart API







menu

1. [talawa](../index.html)
2. [models/events/event\_model.dart](../models_events_event_model/models_events_event_model-library.html)
3. Event class

Event


dark\_mode

light\_mode




# Event class


This class creates an event model and returns an Event instance.


Annotations

* @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId: 10)



## Constructors

[Event](../models_events_event_model/Event/Event.html)({String? id, String? title, String? description, List<[Attendee](../models_events_event_model/Attendee-class.html)>? attendees, String? location, bool? recurring, bool? allDay, String? startDate, String? endDate, String? startTime, String? endTime, bool? isPublic, bool? isRegistered, bool? isRegisterable, [User](../models_user_user_info/User-class.html)? creator, [OrgInfo](../models_organization_org_info/OrgInfo-class.html)? organization, List<[User](../models_user_user_info/User-class.html)>? admins})


[Event.fromJson](../models_events_event_model/Event/Event.fromJson.html)(Map<String, dynamic> json)

factory



## Properties

[admins](../models_events_event_model/Event/admins.html)
↔ List<[User](../models_user_user_info/User-class.html)>?

The admins of the event.
getter/setter pair

[allDay](../models_events_event_model/Event/allDay.html)
↔ bool?

A boolean value that indicates if the event is an all-day event.
getter/setter pair

[attendees](../models_events_event_model/Event/attendees.html)
↔ List<[Attendee](../models_events_event_model/Attendee-class.html)>?

The attendees of the event.
getter/setter pair

[creator](../models_events_event_model/Event/creator.html)
↔ [User](../models_user_user_info/User-class.html)?

The creator of the event.
getter/setter pair

[description](../models_events_event_model/Event/description.html)
↔ String?

The description of the event.
getter/setter pair

[endDate](../models_events_event_model/Event/endDate.html)
↔ String?

The end date of the event.
getter/setter pair

[endTime](../models_events_event_model/Event/endTime.html)
↔ String?

The end time of the event.
getter/setter pair

[hashCode](../models_events_event_model/Event/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[id](../models_events_event_model/Event/id.html)
↔ String?

Unique identifier for the event.
getter/setter pair

[isPublic](../models_events_event_model/Event/isPublic.html)
↔ bool?

A boolean value that indicates if the event is public.
getter/setter pair

[isRegisterable](../models_events_event_model/Event/isRegisterable.html)
↔ bool?

A boolean value that indicates if the event is registerable.
getter/setter pair

[isRegistered](../models_events_event_model/Event/isRegistered.html)
↔ bool?

A boolean value that indicates if the user is registered for the event.
getter/setter pair

[location](../models_events_event_model/Event/location.html)
↔ String?

The location of the event.
getter/setter pair

[organization](../models_events_event_model/Event/organization.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?

The organization of the event.
getter/setter pair

[recurring](../models_events_event_model/Event/recurring.html)
↔ bool?

A boolean value that indicates if the event is recurring.
getter/setter pair

[runtimeType](../models_events_event_model/Event/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[startDate](../models_events_event_model/Event/startDate.html)
↔ String?

The start date of the event.
getter/setter pair

[startTime](../models_events_event_model/Event/startTime.html)
↔ String?

The start time of the event.
getter/setter pair

[title](../models_events_event_model/Event/title.html)
↔ String?

The title of the event.
getter/setter pair



## Methods

[noSuchMethod](../models_events_event_model/Event/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../models_events_event_model/Event/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../models_events_event_model/Event/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_model](../models_events_event_model/models_events_event_model-library.html)
3. Event class

##### event\_model library





talawa
1.0.0+1






