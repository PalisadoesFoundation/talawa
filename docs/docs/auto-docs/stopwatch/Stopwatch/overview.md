# Overview for `Stopwatch`

## Description

A stopwatch which measures time while it's running.

 A stopwatch is either running or stopped.
 It measures the elapsed time that passes while the stopwatch is running.

 When a stopwatch is initially created, it is stopped and has measured no
 elapsed time.

 The elapsed time can be accessed in various formats using
 [elapsed], [elapsedMilliseconds], [elapsedMicroseconds] or [elapsedTicks].

 The stopwatch is started by calling [start].

 Example:
 ```dart
 final stopwatch = ;
 print(stopwatch.elapsedMilliseconds); // 0
 print(stopwatch.isRunning); // false
 stopwatch.;
 print(stopwatch.isRunning); // true
 ```
 To stop or pause the stopwatch, use [stop].
 Use [start] to continue again when only pausing temporarily.
 ```
 stopwatch.;
 print(stopwatch.isRunning); // false
 Duration elapsed = stopwatch.elapsed;
 await Future.delayed(const Duration(seconds: 1));
 assert(stopwatch.elapsed == elapsed); // No measured time elapsed.
 stopwatch.; // Continue measuring.
 ```
 The [reset] method sets the elapsed time back to zero.
 It can be called whether the stopwatch is running or not,
 and doesn't change whether it's running.
 ```
 // Do some work.
 stopwatch.;
 print(stopwatch.elapsedMilliseconds); // Likely > 0.
 stopwatch.;
 print(stopwatch.elapsedMilliseconds); // 0
 ```

## Members

- **_frequency**: `int`
  Cached frequency of the system in Hz (ticks per second).

 Value must be returned by [_initTicker], which is called only once.

- **_start**: `int`
- **_stop**: `int?`
## Constructors

### Unnamed Constructor
Creates a [Stopwatch] in stopped state with a zero elapsed count.

 The following example shows how to start a [Stopwatch]
 immediately after allocation.
 ```dart
 final stopwatch = ..;
 ```

