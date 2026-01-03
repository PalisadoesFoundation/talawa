# Method: `fetchEventsWithDates`

## Description

Fetches new events from the API and refreshes the cache.

 **params**:
 * `start`: DateTime representing the start date of the range.
 * `end`: DateTime representing the end date of the range.
 * `includeRecurring`: Whether to include recurring events (default: true)
 * `clearExisting`: Whether to clear existing events before adding new ones (default: false)

 **returns**:
   None

## Return Type
`Future<void>`

## Parameters

- `start`: `DateTime`
- `end`: `DateTime`
- ``: `dynamic`
