# Method: `deleteEvent`

## Description

This function is used to delete an event.

 **params**:
 * `event`: ID of the event to delete
 * `recurrenceType`: Type of deletion for recurring events:
   - 'standalone' or null: Delete a non-recurring event
   - 'single': Delete a single instance of a recurring event
   - 'series': Delete the entire recurring event series
   - 'thisAndFollowing': Delete this and all following instances

 **returns**:
 * `Future<QueryResult<Object?>>`: Information about the event deletion

## Return Type
`Future<QueryResult<Object?>>`

## Parameters

- `event`: `Event`
- ``: `dynamic`
