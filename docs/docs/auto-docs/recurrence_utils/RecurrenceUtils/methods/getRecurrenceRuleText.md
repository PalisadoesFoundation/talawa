# Method: `getRecurrenceRuleText`

## Description

Generates human-readable description of a recurrence rule.

 **params**:
 * `frequency`: Recurrence frequency (DAILY, WEEKLY, etc.)
 * `interval`: Recurrence interval (e.g., every 2 days)
 * `weekDays`: Selected weekdays for weekly recurrence
 * `byMonthDay`: Selected days of the month for monthly/yearly recurrence
 * `byMonth`: Selected months for yearly recurrence
 * `count`: Number of occurrences
 * `endDate`: End date for recurrence
 * `never`: Whether recurrence never ends
 * `byPosition`: Position in month/year for nth weekday recurrence (1st Monday, 3rd Friday, etc.)
 * `useDayOfWeekMonthly`: Whether to use day-of-week pattern for monthly
 * `useDayOfWeekYearly`: Whether to use day-of-week pattern for yearly

 **returns**:
 * `String`: Human-readable description of recurrence

## Return Type
`String`

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
