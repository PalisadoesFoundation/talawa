# Overview for `InheritedTheme`

## Description

An [InheritedWidget] that defines visual properties like colors
 and text styles, which the [child]'s subtree depends on.

 The [wrap] method is used by [captureAll] and [CapturedThemes.wrap] to
 construct a widget that will wrap a child in all of the inherited themes
 which are present in a specified part of the widget tree.

 A widget that's shown in a different context from the one it's built in,
 like the contents of a new route or an overlay, will be able to see the
 ancestor inherited themes of the context it was built in.

 
 This example demonstrates how `InheritedTheme.` can be used
 to wrap the contents of a new route with the inherited themes that
 are present when the route was built - but are not present when route
 is actually shown.

 If the same code is run without `InheritedTheme., the
 new route's Text widget will inherit the "something must be wrong"
 fallback text style, rather than the default text style defined in MyApp.

 ** See code in examples/api/lib/widgets/inherited_theme/inherited_theme.0.dart **
 

## Dependencies

- InheritedWidget

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

