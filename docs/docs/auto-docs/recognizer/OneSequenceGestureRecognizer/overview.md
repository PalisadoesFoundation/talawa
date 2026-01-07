# Overview for `OneSequenceGestureRecognizer`

## Description

Base class for gesture recognizers that can only recognize one
 gesture at a time. For example, a single [TapGestureRecognizer]
 can never recognize two taps happening simultaneously, even if
 multiple pointers are placed on the same widget.

 This is in contrast to, for instance, [MultiTapGestureRecognizer],
 which manages each pointer independently and can consider multiple
 simultaneous touches to each result in a separate tap.

## Dependencies

- GestureRecognizer

## Members

- **_entries**: `Map&lt;int, GestureArenaEntry&gt;`
- **_trackedPointers**: `Set&lt;int&gt;`
- **_team**: `GestureArenaTeam?`
## Constructors

### Unnamed Constructor
Initialize the object.

 

