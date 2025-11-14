<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [member_name_tile](../../widgets_member_name_tile/widgets_member_name_tile-library.md)
3.  [MemberNameTile](../../widgets_member_name_tile/MemberNameTile-class.md)
4.  build method

<div class="self-name">

build

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_member_name_tile/MemberNameTile-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">build</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">Widget</span> <span class="name">build</span>(

1.  <span id="build-param-context"
    class="parameter"><span class="type-annotation">BuildContext</span>
    <span class="parameter-name">context</span></span>

)

</div>

<div class="section desc markdown">

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given `BuildContext` and when the dependencies of this widget
change (e.g., an `InheritedWidget` referenced by this widget changes).
This method can potentially be called in every frame and should not have
any side effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling `Widget.canUpdate`.

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget's
constructor and from the given `BuildContext`.

The given `BuildContext` contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different `BuildContext`
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

- the fields of the widget, which themselves must not change over time,
  and
- any ambient state obtained from the `context` using
  `BuildContext.dependOnInheritedWidgetOfExactType`.

If a widget's
[build](../../widgets_member_name_tile/MemberNameTile/build.md) method
is to depend on anything else, use a `StatefulWidget` instead.

See also:

- `StatelessWidget`, which contains the discussion on performance
  considerations.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Widget build(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [member_name_tile](../../widgets_member_name_tile/widgets_member_name_tile-library.md)
3.  [MemberNameTile](../../widgets_member_name_tile/MemberNameTile-class.md)
4.  build method

##### MemberNameTile class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
