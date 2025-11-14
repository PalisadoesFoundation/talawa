<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  initState method

<div class="self-name">

initState

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">initState</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">initState</span>

</div>

<div class="section desc markdown">

Called when this object is inserted into the tree.

The framework will call this method exactly once for each `State` object
it creates.

Override this method to perform initialization that depends on the
location at which this object was inserted into the tree (i.e.,
[context](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/context.md))
or on the widget used to configure this object (i.e.,
[widget](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/widget.md)).

If a `State`'s
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
method depends on an object that can itself change state, for example a
`ChangeNotifier` or
[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/initState.md),
[didUpdateWidget](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/didUpdateWidget.md),
and
[dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md):

- In
  [initState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/initState.md),
  subscribe to the object.
- In
  [didUpdateWidget](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/didUpdateWidget.md)
  unsubscribe from the old object and subscribe to the new one if the
  updated widget configuration requires replacing the object.
- In
  [dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md),
  unsubscribe from the object.

You should not use `BuildContext.dependOnInheritedWidgetOfExactType`
from this method. However,
[didChangeDependencies](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/didChangeDependencies.md)
will be called immediately following this method, and
`BuildContext.dependOnInheritedWidgetOfExactType` can be used there.

Implementations of this method should start with a call to the inherited
method, as in `super.`.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  initState method

##### ManageMembersDialogState class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
