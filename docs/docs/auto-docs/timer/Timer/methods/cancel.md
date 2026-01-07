# Method: `cancel`

## Description

Cancels the timer.

 Once a [Timer] has been canceled, the callback function will not be called
 by the timer. Calling [cancel] more than once on a [Timer] is allowed, and
 will have no further effect.

 Example:
 ```dart
 final timer =
     Timer(const Duration(seconds: 5),  => print('Timer finished'));
 // Cancel timer, callback never called.
 timer.;
 ```

## Return Type
`void`

