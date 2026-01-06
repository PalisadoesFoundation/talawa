# Method: `createAgendaItem`

## Description

This function is used to create a new agenda item for an event.

 **params**:
 * `title`: Title of the agenda item.
 * `description`: Description of the agenda item (optional).
 * `duration`: Duration of the agenda item.
 * `attachments`: List of attachment URLs (optional).
 * `urls`: List of related URLs (optional).
 * `categories`: List of category IDs (optional).
 * `sequence`: Sequence number of the agenda item.
 * `itemType`: Type of the agenda item.
 * `isNote`: Whether the agenda item is a note or not.

 **returns**:
 * `Future<EventAgendaItem?>`: Returns the new agenda item if creation is successful.

## Return Type
`Future<EventAgendaItem?>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
