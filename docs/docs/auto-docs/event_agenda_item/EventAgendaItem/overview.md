# Overview for `EventAgendaItem`

## Description

Model for Event Agenda Item.

## Members

- **id**: `String?`
  Unique identifier for the agenda item.

- **name**: `String?`
  Title of the agenda item.

- **description**: `String?`
  Optional description.

- **duration**: `String?`
  Duration of the agenda item.

- **key**: `String?`
  Optional key for the agenda item.

- **attachments**: `List&lt;String&gt;?`
  Optional array of attachment URLs.

- **urls**: `List&lt;String&gt;?`
  Optional array of URLs related to the agenda item.

- **type**: `String?`
  Type of the agenda item.

- **categories**: `List&lt;AgendaCategory&gt;?`
  Optional array of agenda categories.

- **sequence**: `int?`
  Sequence number of the agenda item.

- **createdAt**: `DateTime?`
  Creation date of the agenda item.

- **updatedAt**: `DateTime?`
  Last updated date of the agenda item.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
