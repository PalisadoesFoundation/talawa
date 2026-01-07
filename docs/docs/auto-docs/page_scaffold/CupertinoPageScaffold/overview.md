# Overview for `CupertinoPageScaffold`

## Description

Implements a single iOS application page's layout.

 The scaffold lays out the navigation bar on top and the content between or
 behind the navigation bar.

 When tapping a status bar at the top of the CupertinoPageScaffold, an
 animation will complete for the current primary [ScrollView], scrolling to
 the beginning. This is done using the [PrimaryScrollController] that
 encloses the [ScrollView]. The [ScrollView.primary] flag is used to connect
 a [ScrollView] to the enclosing [PrimaryScrollController].

 
 This example shows a [CupertinoPageScaffold] with a [Center] as a [child].
 The [CupertinoButton] is connected to a callback that increments a counter.
 The [backgroundColor] can be changed.

 ** See code in examples/api/lib/cupertino/page_scaffold/cupertino_page_scaffold.0.dart **
 

 See also:

  * [CupertinoTabScaffold], a similar widget for tabbed applications.
  * [CupertinoPageRoute], a modal page route that typically hosts a
    [CupertinoPageScaffold] with support for iOS-style page transitions.

## Dependencies

- StatefulWidget

## Members

- **navigationBar**: `ObstructingPreferredSizeWidget?`
  The [navigationBar], typically a [CupertinoNavigationBar], is drawn at the
 top of the screen.

 If translucent, the main content may slide behind it.
 Otherwise, the main content's top margin will be offset by its height.

 The scaffold assumes the navigation bar will account for the [MediaQuery]
 top padding, also consume it if the navigation bar is opaque.

 By default [navigationBar] disables text scaling to match the native iOS
 behavior. To override such behavior, wrap each of the [navigationBar]'s
 components inside a [MediaQuery] with the desired [TextScaler].

- **child**: `Widget`
  Widget to show in the main content area.

 Content can slide under the [navigationBar] when they're translucent.
 In that case, the child's [BuildContext]'s [MediaQuery] will have a
 top padding indicating the area of obstructing overlap from the
 [navigationBar].

- **backgroundColor**: `Color?`
  The color of the widget that underlies the entire scaffold.

 By default uses [CupertinoTheme]'s `scaffoldBackgroundColor` when null.

- **resizeToAvoidBottomInset**: `bool`
  Whether the [child] should size itself to avoid the window's bottom inset.

 For example, if there is an onscreen keyboard displayed above the
 scaffold, the body can be resized to avoid overlapping the keyboard, which
 prevents widgets inside the body from being obscured by the keyboard.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a layout for pages with a navigation bar at the top.

