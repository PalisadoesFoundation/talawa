# Overview for `TickerFuture`

## Description

An object representing an ongoing [Ticker] sequence.

 The [Ticker.start] method returns a [TickerFuture]. The [TickerFuture] will
 complete successfully if the [Ticker] is stopped using [Ticker.stop] with
 the `canceled` argument set to false (the default).

 If the [Ticker] is disposed without being stopped, or if it is stopped with
 `canceled` set to true, then this Future will never complete.

 This class works like a normal [Future], but has an additional property,
 [orCancel], which returns a derivative [Future] that completes with an error
 if the [Ticker] that returned the [TickerFuture] was stopped with `canceled`
 set to true, or if it was disposed without being stopped.

 To run a callback when either this future resolves or when the ticker is
 canceled, use [whenCompleteOrCancel].

## Dependencies

- Future

## Members

- **_primaryCompleter**: `Completer&lt;void&gt;`
- **_secondaryCompleter**: `Completer&lt;void&gt;?`
- **_completed**: `bool?`
## Constructors

### _


### complete
Creates a [TickerFuture] instance that represents an already-complete
 [Ticker] sequence.

 This is useful for implementing objects that normally defer to a [Ticker]
 but sometimes can skip the ticker because the animation is of zero
 duration, but which still need to represent the completed animation in the
 form of a [TickerFuture].

