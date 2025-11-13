<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/manage_members_dialog.dart](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  activate method

<div class="self-name">

activate

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">activate</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">activate</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called when this object is reinserted into the tree after having been
removed via
[deactivate](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/deactivate.md).

In most cases, after a `State` object has been deactivated, it is *not*
reinserted into the tree, and its
[dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md)
method will be called to signal that it is ready to be garbage
collected.

In some cases, however, after a `State` object has been deactivated, the
framework will reinsert it into another part of the tree (e.g., if the
subtree containing this `State` object is grafted from one location in
the tree to another due to the use of a `GlobalKey`). If that happens,
the framework will call
[activate](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/activate.md)
to give the `State` object a chance to reacquire any resources that it
released in
[deactivate](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/deactivate.md).
It will then also call
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
to give the object a chance to adapt to its new location in the tree. If
the framework does reinsert this subtree, it will do so before the end
of the animation frame in which the subtree was removed from the tree.
For this reason, `State` objects can defer releasing most resources
until the framework calls their
[dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md)
method.

The framework does not call this method the first time a `State` object
is inserted into the tree. Instead, the framework calls
[initState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/initState.md)
in that situation.

Implementations of this method should start with a call to the inherited
method, as in `super.`.

See also:

- `Element.activate`, the corresponding method when an element
  transitions from the "inactive" to the "active" lifecycle state.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@protected
@mustCallSuper
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
4.  activate method

##### ManageMembersDialogState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
