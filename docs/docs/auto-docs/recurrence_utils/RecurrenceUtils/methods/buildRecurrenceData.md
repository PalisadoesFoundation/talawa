# Method: `buildRecurrenceData`

## Description

Builds a complete recurrence data map for the API.

 This utility method centralizes the logic for creating recurrence data maps
 that match the backend API expectations. It handles all recurrence types
 and generates proper parameters based on the frequency.

 **params**:
 * `frequency`: Recurrence frequency (DAILY, WEEKLY, etc.)
 * `interval`: Recurrence interval (e.g., every 2 days)
 * `weekDays`: Selected weekdays for weekly recurrence
 * `eventStartDate`: The event's start date (used for defaults)
 * `byMonthDay`: Selected days of the month for monthly/yearly recurrence
 * `byMonth`: Selected months for yearly recurrence
 * `count`: Number of occurrences
 * `recurrenceEndDate`: End date for recurrence
 * `never`: Whether recurrence never ends
 * `eventEndType`: Type of end condition (never, after, on)
 * `byPosition`: Position in month/year for nth weekday recurrence (1st Monday, 3rd Friday, etc.)
 * `useDayOfWeekMonthly`: Whether to use day-of-week pattern for monthly
 * `useDayOfWeekYearly`: Whether to use day-of-week pattern for yearly

 **returns**:
 * `Map&lt;String, dynamic&gt;`: Complete recurrence data map ready for the API

## Return Type
`Map&lt;String, dynamic&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
