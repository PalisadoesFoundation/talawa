# Overview for `FutureBuilder`

## Description

A widget that builds itself based on the latest snapshot of interaction with
 a [Future].

 

 ## Managing the future

 The [future] must have been obtained earlier, e.g. during [State.initState],
 [State.didUpdateWidget], or [State.didChangeDependencies]. It must not be
 created during the [State.build] or [StatelessWidget.build] method call when
 constructing the [FutureBuilder]. If the [future] is created at the same
 time as the [FutureBuilder], then every time the [FutureBuilder]'s parent is
 rebuilt, the asynchronous task will be restarted.

 A general guideline is to assume that every `build` method could get called
 every frame, and to treat omitted calls as an optimization.

 ## Timing

 Widget rebuilding is scheduled by the completion of the future, using
 [State.setState], but is otherwise decoupled from the timing of the future.
 The [builder] callback is called at the discretion of the Flutter pipeline, and
 will thus receive a timing-dependent sub-sequence of the snapshots that
 represent the interaction with the future.

 A side-effect of this is that providing a new but already-completed future
 to a [FutureBuilder] will result in a single frame in the
 [ConnectionState.waiting] state. This is because there is no way to
 synchronously determine that a [Future] has already completed.

 ## Builder contract

 For a future that completes successfully with data, assuming [initialData]
 is null, the [builder] will be called with either both or only the latter of
 the following snapshots:

 * `AsyncSnapshot&lt;String&gt;.withData(ConnectionState.waiting, null)`
 * `AsyncSnapshot&lt;String&gt;.withData(ConnectionState.done, 'some data')`

 If that same future instead completed with an error, the [builder] would be
 called with either both or only the latter of:

 * `AsyncSnapshot&lt;String&gt;.withData(ConnectionState.waiting, null)`
 * `AsyncSnapshot&lt;String&gt;.withError(ConnectionState.done, 'some error', someStackTrace)`

 The initial snapshot data can be controlled by specifying [initialData]. You
 would use this facility to ensure that if the [builder] is invoked before
 the future completes, the snapshot carries data of your choice rather than
 the default null value.

 The data and error fields of the snapshot change only as the connection
 state field transitions from `waiting` to `done`, and they will be retained
 when changing the [FutureBuilder] configuration to another future. If the
 old future has already completed successfully with data as above, changing
 configuration to a new future results in snapshot pairs of the form:

 * `AsyncSnapshot&lt;String&gt;.withData(ConnectionState.none, 'data of first future')`
 * `AsyncSnapshot&lt;String&gt;.withData(ConnectionState.waiting, 'data of second future')`

 In general, the latter will be produced only when the new future is
 non-null, and the former only when the old future is non-null.

 A [FutureBuilder] behaves identically to a [StreamBuilder] configured with
 `future?.`, except that snapshots with `ConnectionState.active`
 may appear for the latter, depending on how the stream is implemented.

 
 This sample shows a [FutureBuilder] that displays a loading spinner while it
 loads data. It displays a success icon and text if the [Future] completes
 with a result, or an error icon and text if the [Future] completes with an
 error. Assume the `_calculation` field is set by pressing a button elsewhere
 in the UI.

 ** See code in examples/api/lib/widgets/async/future_builder.0.dart **
 

## Dependencies

- StatefulWidget

## Members

- **future**: `Future&lt;T&gt;?`
  The asynchronous computation to which this builder is currently connected,
 possibly null.

 If no future has yet completed, including in the case where [future] is
 null, the data provided to the [builder] will be set to [initialData].

- **builder**: `AsyncWidgetBuilder&lt;T&gt;`
  The build strategy currently used by this builder.

 The builder is provided with an [AsyncSnapshot] object whose
 [AsyncSnapshot.connectionState] property will be one of the following
 values:

  * [ConnectionState.none]: [future] is null. The [AsyncSnapshot.data] will
    be set to [initialData], unless a future has previously completed, in
    which case the previous result persists.

  * [ConnectionState.waiting]: [future] is not null, but has not yet
    completed. The [AsyncSnapshot.data] will be set to [initialData],
    unless a future has previously completed, in which case the previous
    result persists.

  * [ConnectionState.done]: [future] is not null, and has completed. If the
    future completed successfully, the [AsyncSnapshot.data] will be set to
    the value to which the future completed. If it completed with an error,
    [AsyncSnapshot.hasError] will be true and [AsyncSnapshot.error] will be
    set to the error object.

 This builder must only return a widget and should not have any side
 effects as it may be called multiple times.

- **initialData**: `T?`
  The data that will be used to create the snapshots provided until a
 non-null [future] has completed.

 If the future completes with an error, the data in the [AsyncSnapshot]
 provided to the [builder] will become null, regardless of [initialData].
 (The error itself will be available in [AsyncSnapshot.error], and
 [AsyncSnapshot.hasError] will be true.)

- **debugRethrowError**: `bool`
  Whether the latest error received by the asynchronous computation should
 be rethrown or swallowed. This property is useful for debugging purposes.

 When set to true, will rethrow the latest error only in debug mode.

 Defaults to `false`, resulting in swallowing of errors.

## Constructors

### Unnamed Constructor
Creates a widget that builds itself based on the latest snapshot of
 interaction with a [Future].

