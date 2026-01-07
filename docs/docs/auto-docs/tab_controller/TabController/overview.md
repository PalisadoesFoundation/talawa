# Overview for `TabController`

## Description

Coordinates tab selection between a [TabBar] and a [TabBarView].

 The [index] property is the index of the selected tab and the [animation]
 represents the current scroll positions of the tab bar and the tab bar view.
 The selected tab's index can be changed with [animateTo].

 A stateful widget that builds a [TabBar] or a [TabBarView] can create
 a [TabController] and share it directly.

 When the [TabBar] and [TabBarView] don't have a convenient stateful
 ancestor, a [TabController] can be shared by providing a
 [DefaultTabController] inherited widget.

 

 

 This widget introduces a [Scaffold] with an [AppBar] and a [TabBar].

 ```dart
 class MyTabbedPage extends StatefulWidget 

 class _MyTabbedPageState extends State&lt;MyTabbedPage&gt; with SingleTickerProviderStateMixin 
 ```
 

 
 This example shows how to listen to page updates in [TabBar] and [TabBarView]
 when using [DefaultTabController].

 ** See code in examples/api/lib/material/tab_controller/tab_controller.1.dart **
 

## Dependencies

- ChangeNotifier

## Members

- **_animationController**: `AnimationController?`
- **_animationDuration**: `Duration`
- **length**: `int`
  The total number of tabs.

 Typically greater than one. Must match [TabBar.tabs]'s and
 [TabBarView.children]'s length.

- **_index**: `int`
- **_previousIndex**: `int`
- **_indexIsChangingCount**: `int`
## Constructors

### Unnamed Constructor
Creates an object that manages the state required by [TabBar] and a
 [TabBarView].

 The [length] must not be negative. Typically it's a value greater than
 one, i.e. typically there are two or more tabs. The [length] must match
 [TabBar.tabs]'s and [TabBarView.children]'s length.

 The `initialIndex` must be valid given [length]. If [length] is zero, then
 `initialIndex` must be 0 (the default).

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
