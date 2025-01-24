




EventAgendaItem class - event\_agenda\_item library - Dart API







menu

1. [talawa](../index.html)
2. [models/events/event\_agenda\_item.dart](../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. EventAgendaItem class

EventAgendaItem


dark\_mode

light\_mode




# EventAgendaItem class


Model for Event Agenda Item.


## Constructors

[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.html)({String? id, String? title, String? description, String? duration, List<String>? attachments, [User](../models_user_user_info/User-class.html)? createdBy, List<String>? urls, [Event](../models_events_event_model/Event-class.html)? relatedEvent, List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>? categories, int? sequence, [OrgInfo](../models_organization_org_info/OrgInfo-class.html)? organization})


[EventAgendaItem.fromJson](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.fromJson.html)(Map<String, dynamic> json)

factory



## Properties

[attachments](../models_events_event_agenda_item/EventAgendaItem/attachments.html)
→ List<String>?

Optional array of attachment URLs.
final

[categories](../models_events_event_agenda_item/EventAgendaItem/categories.html)
→ List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>?

Optional array of agenda categories.
final

[createdBy](../models_events_event_agenda_item/EventAgendaItem/createdBy.html)
→ [User](../models_user_user_info/User-class.html)?

Reference to the user who created the agenda item.
final

[description](../models_events_event_agenda_item/EventAgendaItem/description.html)
→ String?

Optional description.
final

[duration](../models_events_event_agenda_item/EventAgendaItem/duration.html)
→ String?

Duration of the agenda item.
final

[hashCode](../models_events_event_agenda_item/EventAgendaItem/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[id](../models_events_event_agenda_item/EventAgendaItem/id.html)
→ String?

Unique identifier for the agenda item.
final

[organization](../models_events_event_agenda_item/EventAgendaItem/organization.html)
→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?

Reference to the organization associated with the agenda item.
final

[relatedEvent](../models_events_event_agenda_item/EventAgendaItem/relatedEvent.html)
→ [Event](../models_events_event_model/Event-class.html)?

Reference to the event associated with the agenda item.
final

[runtimeType](../models_events_event_agenda_item/EventAgendaItem/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[sequence](../models_events_event_agenda_item/EventAgendaItem/sequence.html)
→ int?

Sequence number of the agenda item.
final

[title](../models_events_event_agenda_item/EventAgendaItem/title.html)
→ String?

Title of the agenda item.
final

[urls](../models_events_event_agenda_item/EventAgendaItem/urls.html)
→ List<String>?

Optional array of URLs related to the agenda item.
final



## Methods

[noSuchMethod](../models_events_event_agenda_item/EventAgendaItem/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../models_events_event_agenda_item/EventAgendaItem/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../models_events_event_agenda_item/EventAgendaItem/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_agenda\_item](../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. EventAgendaItem class

##### event\_agenda\_item library





talawa
1.0.0+1






