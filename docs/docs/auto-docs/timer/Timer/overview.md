# Overview for `Timer`

## Description

A countdown timer that can be configured to fire once or repeatedly.

 The timer counts down from the specified duration to 0.
 When the timer reaches 0, the timer invokes the specified callback function.
 Use a periodic timer to repeatedly count down the same interval.

 A negative duration is treated the same as [Duration.zero].
 If the duration is statically known to be 0, consider using [run].

 ```dart
 void  

 void  
 ```
 **Note:** If Dart code using [Timer] is compiled to JavaScript, the finest
 granularity available in the browser is 4 milliseconds.

 See also:
 * [Stopwatch] for measuring elapsed time.

## Constructors

### Unnamed Constructor
Creates a new timer.

 The [callback] function is invoked after the given [duration].

 Example:
 ```dart
 final timer =
     Timer(const Duration(seconds: 5),  => print('Timer finished'));
 // Outputs after 5 seconds: "Timer finished".
 ```

### periodic
Creates a new repeating timer.

 The [callback] is invoked repeatedly with [duration] intervals until
 canceled with the [cancel] function.

 The exact timing depends on the underlying timer implementation.
 No more than `n` callbacks will be made in `duration * n` time,
 but the time between two consecutive callbacks
 can be shorter and longer than `duration`.

 In particular, an implementation may schedule the next callback, e.g.,
 a `duration` after either when the previous callback ended,
 when the previous callback started, or when the previous callback was
 scheduled for - even if the actual callback was delayed.

 A negative [duration] is treated the same as [Duration.zero].

 Example:
 ```dart
 var counter = 3;
 Timer.periodic(const Duration(seconds: 2), (timer) );
 // Outputs:
 // 1
 // 2
 // 3
 // "Cancel timer"
 ```

#### Parameters

- `duration`: `Duration`
- ``: `dynamic`
