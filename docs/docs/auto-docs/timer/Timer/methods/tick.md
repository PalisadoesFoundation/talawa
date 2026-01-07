# Method: `tick`

## Description

The number of durations preceding the most recent timer event.

 The value starts at zero and is incremented each time a timer event
 occurs, so each callback will see a larger value than the previous one.

 If a periodic timer with a non-zero duration is delayed too much,
 so more than one tick should have happened,
 all but the last tick in the past are considered "missed",
 and no callback is invoked for them.
 The [tick] count reflects the number of durations that have passed and
 not the number of callback invocations that have happened.

 Example:
 ```dart
 final stopwatch = ..;
 Timer.periodic(const Duration(seconds: 1), (timer) );
 // Outputs:
 // 1
 // 4
 ```

## Return Type
`int`

