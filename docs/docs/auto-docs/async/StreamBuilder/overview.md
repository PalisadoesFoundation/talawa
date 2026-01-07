# Overview for `StreamBuilder`

## Description

Widget that builds itself based on the latest snapshot of interaction with
 a [Stream].

 

 ## Managing the stream

 The [stream] must have been obtained earlier, e.g. during [State.initState],
 [State.didUpdateWidget], or [State.didChangeDependencies]. It must not be
 created during the [State.build] or [StatelessWidget.build] method call when
 constructing the [StreamBuilder]. If the [stream] is created at the same
 time as the [StreamBuilder], then every time the [StreamBuilder]'s parent is
 rebuilt, the asynchronous task will be restarted.

 A general guideline is to assume that every `build` method could get called
 every frame, and to treat omitted calls as an optimization.

 ## Timing

 Widget rebuilding is scheduled by each interaction, using [State.setState],
 but is otherwise decoupled from the timing of the stream. The [builder]
 is called at the discretion of the Flutter pipeline, and will thus receive a
 timing-dependent sub-sequence of the snapshots that represent the
 interaction with the stream.

 As an example, when interacting with a stream producing the integers
 0 through 9, the [builder] may be called with any ordered sub-sequence
 of the following snapshots that includes the last one (the one with
 ConnectionState.done):

 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.waiting, null)`
 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.active, 0)`
 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.active, 1)`
 * ...
 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.active, 9)`
 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.done, 9)`

 The actual sequence of invocations of the [builder] depends on the relative
 timing of events produced by the stream and the build rate of the Flutter
 pipeline.

 Changing the [StreamBuilder] configuration to another stream during event
 generation introduces snapshot pairs of the form:

 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.none, 5)`
 * `AsyncSnapshot&lt;int&gt;.withData(ConnectionState.waiting, 5)`

 The latter will be produced only when the new stream is non-null, and the
 former only when the old stream is non-null.

 The stream may produce errors, resulting in snapshots of the form:

 * `AsyncSnapshot&lt;int&gt;.withError(ConnectionState.active, 'some error', someStackTrace)`

 The data and error fields of snapshots produced are only changed when the
 state is `ConnectionState.active`.

 The initial snapshot data can be controlled by specifying [initialData].
 This should be used to ensure that the first frame has the expected value,
 as the builder will always be called before the stream listener has a chance
 to be processed.

 
 This sample shows a [StreamBuilder] that listens to a Stream that emits bids
 for an auction. Every time the StreamBuilder receives a bid from the Stream,
 it will display the price of the bid below an icon. If the Stream emits an
 error, the error is displayed below an error icon. When the Stream finishes
 emitting bids, the final price is displayed.

 ** See code in examples/api/lib/widgets/async/stream_builder.0.dart **
 

 See also:

  * [ValueListenableBuilder], which wraps a [ValueListenable] instead of a
    [Stream].
  * [StreamBuilderBase], which supports widget building based on a computation
    that spans all interactions made with the stream.

## Dependencies

- StreamBuilderBase

## Members

- **builder**: `AsyncWidgetBuilder&lt;T&gt;`
  The build strategy currently used by this builder.

 This builder must only return a widget and should not have any side
 effects as it may be called multiple times.

- **initialData**: `T?`
  The data that will be used to create the initial snapshot.

 Providing this value (presumably obtained synchronously somehow when the
 [Stream] was created) ensures that the first frame will show useful data.
 Otherwise, the first frame will be built with the value null, regardless
 of whether a value is available on the stream: since streams are
 asynchronous, no events from the stream can be obtained before the initial
 build.

## Constructors

### Unnamed Constructor
Creates a new [StreamBuilder] that builds itself based on the latest
 snapshot of interaction with the specified [stream] and whose build
 strategy is given by [builder].

 The [initialData] is used to create the initial snapshot.

