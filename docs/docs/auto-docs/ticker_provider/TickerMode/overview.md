# Overview for `TickerMode`

## Description

Enables or disables tickers (and thus animation controllers) in the widget
 subtree.

 This only works if [AnimationController] objects are created using
 widget-aware ticker providers. For example, using a
 [TickerProviderStateMixin] or a [SingleTickerProviderStateMixin].

## Dependencies

- StatefulWidget

## Members

- **enabled**: `bool`
  The requested ticker mode for this subtree.

 The effective ticker mode of this subtree may differ from this value
 if there is an ancestor [TickerMode] with this field set to false.

 If true and all ancestor [TickerMode]s are also enabled, then tickers in
 this subtree will tick.

 If false, then tickers in this subtree will not tick regardless of any
 ancestor [TickerMode]s. Animations driven by such tickers are not paused,
 they just don't call their callbacks. Time still elapses.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that enables or disables tickers.

