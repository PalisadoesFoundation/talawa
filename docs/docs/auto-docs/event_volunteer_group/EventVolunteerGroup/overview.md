# Overview for `EventVolunteerGroup`

## Description

This class creates an event volunteer group model and returns an EventVolunteerGroup instance.

## Members

- **id**: `String?`
  Unique identifier for the event volunteer group.

- **createdAt**: `String?`
  The creation date of the event volunteer group.

- **creator**: `User?`
  The creator of the event volunteer group.

- **event**: `Event?`
  The event associated with the event volunteer group.

- **leader**: `User?`
  The leader of the event volunteer group.

- **name**: `String?`
  The name of the event volunteer group.

- **updatedAt**: `String?`
  The last update date of the event volunteer group.

- **volunteers**: `List&lt;EventVolunteer&gt;?`
  The list of volunteers in the event volunteer group.

- **volunteersRequired**: `int?`
  The number of volunteers required for the event volunteer group.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
