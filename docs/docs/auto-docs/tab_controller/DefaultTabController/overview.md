# Overview for `DefaultTabController`

## Description

The [TabController] for descendant widgets that don't specify one
 explicitly.

 

 [DefaultTabController] is an inherited widget that is used to share a
 [TabController] with a [TabBar] or a [TabBarView]. It's used when sharing an
 explicitly created [TabController] isn't convenient because the tab bar
 widgets are created by a stateless parent widget or by different parent
 widgets.

 

 ```dart
 class MyDemo extends StatelessWidget 
 ```

## Dependencies

- StatefulWidget

## Members

- **length**: `int`
  The total number of tabs.

 Typically greater than one. Must match [TabBar.tabs]'s and
 [TabBarView.children]'s length.

- **initialIndex**: `int`
  The initial index of the selected tab.

 Defaults to zero.

- **animationDuration**: `Duration?`
  Controls the duration of DefaultTabController and TabBarView animations.

 Defaults to kTabScrollDuration.

- **child**: `Widget`
  The widget below this widget in the tree.

 Typically a [Scaffold] whose [AppBar] includes a [TabBar].

 

## Constructors

### Unnamed Constructor
Creates a default tab controller for the given [child] widget.

 The [length] argument is typically greater than one. The [length] must
 match [TabBar.tabs]'s and [TabBarView.children]'s length.

