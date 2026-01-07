# Overview for `Expansible`

## Description

A [StatefulWidget] that expands and collapses.

 An [Expansible] consists of a header, which is always shown, and a
 body, which is hidden in its collapsed state and shown in its expanded
 state.

 The [Expansible] is expanded or collapsed with an animation driven by an
 [AnimationController]. When the widget is expanded, the height of its body
 animates from 0 to its fully expanded height.

 This widget is typically used with [ListView] to create an "expand /
 collapse" list entry. When used with scrolling widgets like [ListView], a
 unique [PageStorageKey] must be specified as the [key], to enable the
 [Expansible] to save and restore its expanded state when it is scrolled
 in and out of view.

 Provide [headerBuilder] and [bodyBuilder] callbacks to
 build the header and body widgets. An additional [expansibleBuilder]
 callback can be provided to further customize the layout of the widget.

 The [Expansible] does not inherently toggle the expansion state. To toggle
 the expansion state, call [ExpansibleController.expand] and
 [ExpansibleController.collapse] as needed, most typically when the header
 returned in [headerBuilder] is tapped.

 See also:

  * [ExpansionTile], a Material-styled widget that expands and collapses.

## Dependencies

- StatefulWidget

## Members

- **controller**: `ExpansibleController`
  Expands and collapses the widget.

 The controller manages the expansion state and toggles the expansion.

- **headerBuilder**: `ExpansibleComponentBuilder`
  Builds the always-displayed header.

 Many use cases involve toggling the expansion state when this header is
 tapped. To toggle the expansion state, call [ExpansibleController.expand]
 or [ExpansibleController.collapse].

- **bodyBuilder**: `ExpansibleComponentBuilder`
  Builds the collapsible body.

 When this widget is expanded, the height of its body animates from 0 to
 its fully extended height.

- **duration**: `Duration`
  The duration of the expansion animation.

 Defaults to a duration of 200ms.

- **curve**: `Curve`
  The curve of the expansion animation.

 Defaults to [Curves.ease].

- **reverseCurve**: `Curve?`
  The reverse curve of the expansion animation.

 If null, uses [curve] in both directions.

- **maintainState**: `bool`
  Whether the state of the body is maintained when the widget expands or
 collapses.

 If true, the body is kept in the tree while the widget is
 collapsed. Otherwise, the body is removed from the tree when the
 widget is collapsed and recreated upon expansion.

 Defaults to false.

- **expansibleBuilder**: `ExpansibleBuilder`
  Builds the widget with the results of [headerBuilder] and [bodyBuilder].

 Defaults to placing the header and body in a [Column].

## Constructors

### Unnamed Constructor
Creates an instance of [Expansible].

