# Overview for `CupertinoTabScaffold`

## Description

Implements a tabbed iOS application's root layout and behavior structure.

 The scaffold lays out the tab bar at the bottom and the content between or
 behind the tab bar.

 A [tabBar] and a [tabBuilder] are required. The [CupertinoTabScaffold]
 will automatically listen to the provided [CupertinoTabBar]'s tap callbacks
 to change the active tab.

 A [controller] can be used to provide an initially selected tab index and manage
 subsequent tab changes. If a controller is not specified, the scaffold will
 create its own [CupertinoTabController] and manage it internally. Otherwise
 it's up to the owner of [controller] to call `dispose` on it after finish
 using it.

 Tabs' contents are built with the provided [tabBuilder] at the active
 tab index. The [tabBuilder] must be able to build the same number of
 pages as there are [tabBar] items. Inactive tabs will be moved [Offstage]
 and their animations disabled.

 Adding/removing tabs, or changing the order of tabs is supported but not
 recommended. Doing so is against the iOS human interface guidelines, and
 [CupertinoTabScaffold] may lose some tabs' state in the process.

 Use [CupertinoTabView] as the root widget of each tab to support tabs with
 parallel navigation state and history. Since each [CupertinoTabView] contains
 a [Navigator], rebuilding the [CupertinoTabView] with a different
 [WidgetBuilder] instance in [CupertinoTabView.builder] will not recreate
 the [CupertinoTabView]'s navigation stack or update its UI. To update the
 contents of the [CupertinoTabView] after it's built, trigger a rebuild
 (via [State.setState], for instance) from its descendant rather than from
 its ancestor.

 
 A sample code implementing a typical iOS information architecture with tabs.

 ** See code in examples/api/lib/cupertino/tab_scaffold/cupertino_tab_scaffold.0.dart **
 

 To push a route above all tabs instead of inside the currently selected one
 (such as when showing a dialog on top of this scaffold), use
 `Navigator.of(rootNavigator: true)` from inside the [BuildContext] of a
 [CupertinoTabView].

 See also:

  * [CupertinoTabBar], the bottom tab bar inserted in the scaffold.
  * [CupertinoTabController], the selection state of this widget.
  * [CupertinoTabView], the typical root content of each tab that holds its own
    [Navigator] stack.
  * [CupertinoPageRoute], a route hosting modal pages with iOS style transitions.
  * [CupertinoPageScaffold], typical contents of an iOS modal page implementing
    layout with a navigation bar on top.
  * [iOS human interface guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/bars/tab-bars/).

## Dependencies

- StatefulWidget

## Members

- **tabBar**: `CupertinoTabBar`
  The [tabBar] is a [CupertinoTabBar] drawn at the bottom of the screen
 that lets the user switch between different tabs in the main content area
 when present.

 The [CupertinoTabBar.currentIndex] is only used to initialize a
 [CupertinoTabController] when no [controller] is provided. Subsequently
 providing a different [CupertinoTabBar.currentIndex] does not affect the
 scaffold or the tab bar's active tab index. To programmatically change
 the active tab index, use a [CupertinoTabController].

 If [CupertinoTabBar.onTap] is provided, it will still be called.
 [CupertinoTabScaffold] automatically also listen to the
 [CupertinoTabBar]'s `onTap` to change the [controller]'s `index`
 and change the actively displayed tab in [CupertinoTabScaffold]'s own
 main content area.

 If translucent, the main content may slide behind it.
 Otherwise, the main content's bottom margin will be offset by its height.

 By default [tabBar] disables text scaling to match the native iOS behavior.
 To override this behavior, wrap each of the [tabBar]'s items inside a
 [MediaQuery] with the desired [TextScaler].

- **controller**: `CupertinoTabController?`
  Controls the currently selected tab index of the [tabBar], as well as the
 active tab index of the [tabBuilder]. Providing a different [controller]
 will also update the scaffold's current active index to the new controller's
 index value.

 Defaults to null.

- **tabBuilder**: `IndexedWidgetBuilder`
  An [IndexedWidgetBuilder] that's called when tabs become active.

 The widgets built by [IndexedWidgetBuilder] are typically a
 [CupertinoTabView] in order to achieve the parallel hierarchical
 information architecture seen on iOS apps with tab bars.

 When the tab becomes inactive, its content is cached in the widget tree
 [Offstage] and its animations disabled.

 Content can slide under the [tabBar] when they're translucent.
 In that case, the child's [BuildContext]'s [MediaQuery] will have a
 bottom padding indicating the area of obstructing overlap from the
 [tabBar].

- **backgroundColor**: `Color?`
  The color of the widget that underlies the entire scaffold.

 By default uses [CupertinoTheme]'s `scaffoldBackgroundColor` when null.

- **resizeToAvoidBottomInset**: `bool`
  Whether the body should size itself to avoid the window's bottom inset.

 For example, if there is an onscreen keyboard displayed above the
 scaffold, the body can be resized to avoid overlapping the keyboard, which
 prevents widgets inside the body from being obscured by the keyboard.

 Defaults to true.

- **restorationId**: `String?`
  Restoration ID to save and restore the state of the [CupertinoTabScaffold].

 This property only has an effect when no [controller] has been provided:
 If it is non-null (and no [controller] has been provided), the scaffold
 will persist and restore the currently selected tab index. If a
 [controller] has been provided, it is the responsibility of the owner of
 that controller to persist and restore it, e.g. by using a
 [RestorableCupertinoTabController].

 The state of this widget is persisted in a [RestorationBucket] claimed
 from the surrounding [RestorationScope] using the provided restoration ID.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

## Constructors

### Unnamed Constructor
Creates a layout for applications with a tab bar at the bottom.

