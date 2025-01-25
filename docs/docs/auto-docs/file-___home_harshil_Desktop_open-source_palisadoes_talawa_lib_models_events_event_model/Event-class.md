




Event class - event\_model library - Dart API







menu

1. [talawa](../index.html)
2. [models/events/event\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. Event class

Event


dark\_mode

light\_mode




# Event class


This class creates an event model and returns an Event instance.


## Constructors

[Event](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/Event.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? id, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? title, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Attendee](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)>? attendees, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? location, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? recurring, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? allDay, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? startDate, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? endDate, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? startTime, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? endTime, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? isPublic, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? isRegistered, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? isRegisterable, dynamic creator, dynamic organization, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)? admins})


[Event.fromJson](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/Event.fromJson.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)

factory



## Properties

[admins](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/admins.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?

The admins of the event.
getter/setter pair

[allDay](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/allDay.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?

A boolean value that indicates if the event is an all-day event.
getter/setter pair

[attendees](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/attendees.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Attendee](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)>?

The attendees of the event.
getter/setter pair

[creator](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/creator.html)
↔ dynamic

The creator of the event.
getter/setter pair

[description](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/description.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The description of the event.
getter/setter pair

[endDate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/endDate.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The end date of the event.
getter/setter pair

[endTime](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/endTime.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The end time of the event.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[id](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/id.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

Unique identifier for the event.
getter/setter pair

[isPublic](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/isPublic.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?

A boolean value that indicates if the event is public.
getter/setter pair

[isRegisterable](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/isRegisterable.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?

A boolean value that indicates if the event is registerable.
getter/setter pair

[isRegistered](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/isRegistered.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?

A boolean value that indicates if the user is registered for the event.
getter/setter pair

[location](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/location.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The location of the event.
getter/setter pair

[organization](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/organization.html)
↔ dynamic

The organization of the event.
getter/setter pair

[recurring](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/recurring.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?

A boolean value that indicates if the event is recurring.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[startDate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/startDate.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The start date of the event.
getter/setter pair

[startTime](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/startTime.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The start time of the event.
getter/setter pair

[title](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event/title.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

The title of the event.
getter/setter pair



## Methods

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. Event class

##### event\_model library





talawa
1.0.0+1






