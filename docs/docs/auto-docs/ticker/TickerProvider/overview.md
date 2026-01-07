# Overview for `TickerProvider`

## Description

An interface implemented by classes that can vend [Ticker] objects.

 To obtain a [TickerProvider], consider mixing in either
 [TickerProviderStateMixin] (which always works)
 or [SingleTickerProviderStateMixin] (which is more efficient when it works)
 to make a [State] subclass implement [TickerProvider].
 That [State] can then be passed to lower-level widgets
 or other related objects.
 This ensures the resulting [Ticker]s will only tick when that [State]'s
 subtree is enabled, as defined by [TickerMode].

 In widget tests, the [WidgetTester] object is also a [TickerProvider].

 Tickers can be used by any object that wants to be notified whenever a frame
 triggers, but are most commonly used indirectly via an
 [AnimationController]. [AnimationController]s need a [TickerProvider] to
 obtain their [Ticker].

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

