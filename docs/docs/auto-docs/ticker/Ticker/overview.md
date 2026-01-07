# Overview for `Ticker`

## Description

Calls its callback once per animation frame, when enabled.

 To obtain a ticker, consider [TickerProvider].

 When created, a ticker is initially disabled. Call [start] to
 enable the ticker.

 A [Ticker] can be silenced by setting [muted] to true. While silenced, time
 still elapses, and [start] and [stop] can still be called, but no callbacks
 are called.

 By convention, the [start] and [stop] methods are used by the ticker's
 consumer (for example, an [AnimationController]), and the [muted] property
 is controlled by the [TickerProvider] that created the ticker (for example,
 a [State] that uses [TickerProviderStateMixin] to silence the ticker when
 the state's subtree is disabled as defined by [TickerMode]).

 See also:

 * [TickerProvider], for obtaining a ticker.
 * [SchedulerBinding.scheduleFrameCallback], which drives tickers.

## Members

- **_future**: `TickerFuture?`
- **_muted**: `bool`
- **_startTime**: `Duration?`
  The frame timestamp when the ticker was last started,
 as reported by [SchedulerBinding.currentFrameTimeStamp].

- **_onTick**: `TickerCallback`
- **_animationId**: `int?`
- **debugLabel**: `String?`
  An optional label can be provided for debugging purposes.

 This label will appear in the [toString] output in debug builds.

- **_debugCreationStack**: `StackTrace`
## Constructors

### Unnamed Constructor
Creates a ticker that will call the provided callback once per frame while
 running.

 An optional label can be provided for debugging purposes. That label
 will appear in the [toString] output in debug builds.

