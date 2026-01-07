# Overview for `CupertinoTabController`

## Description

Coordinates tab selection between a [CupertinoTabBar] and a [CupertinoTabScaffold].

 The [index] property is the index of the selected tab. Changing its value
 updates the actively displayed tab of the [CupertinoTabScaffold] the
 [CupertinoTabController] controls, as well as the currently selected tab item of
 its [CupertinoTabBar].

 
 This samples shows how [CupertinoTabController] can be used to switch tabs in
 [CupertinoTabScaffold].

 ** See code in examples/api/lib/cupertino/tab_scaffold/cupertino_tab_controller.0.dart **
 

 See also:

  * [CupertinoTabScaffold], a tabbed application root layout that can be
    controlled by a [CupertinoTabController].
  * [RestorableCupertinoTabController], which is a restorable version
    of this controller.

## Dependencies

- ChangeNotifier

## Members

- **_isDisposed**: `bool`
- **_index**: `int`
## Constructors

### Unnamed Constructor
Creates a [CupertinoTabController] to control the tab index of [CupertinoTabScaffold]
 and [CupertinoTabBar].

 The [initialIndex] defaults to 0. The value must be greater than or equal
 to 0, and less than the total number of tabs.

