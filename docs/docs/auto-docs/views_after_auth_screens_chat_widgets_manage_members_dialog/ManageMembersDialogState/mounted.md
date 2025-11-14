<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  mounted property

<div class="self-name">

mounted

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

# <span class="kind-property">mounted</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">mounted</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Whether this `State` object is currently in a tree.

After creating a `State` object and before calling
[initState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/initState.md),
the framework "mounts" the `State` object by associating it with a
`BuildContext`. The `State` object remains mounted until the framework
calls
[dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md),
after which time the framework will never ask the `State` object to
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
again.

It is an error to call
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
unless
[mounted](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/mounted.md)
is true.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
bool get mounted => _element != null;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  mounted property

##### ManageMembersDialogState class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
