<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  setState method

<div class="self-name">

setState

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

# <span class="kind-method">setState</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)

</div>

<span class="returntype">void</span> <span class="name">setState</span>(

1.  <span id="setState-param-fn"
    class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span>
    <span class="parameter-name">fn</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Notify the framework that the internal state of this object has changed.

Whenever you change the internal state of a `State` object, make the
change in a function that you pass to
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md):

``` language-dart
setState( );
```

The provided callback is immediately called synchronously. It must not
return a future (the callback cannot be `async`), since then it would be
unclear when the state was actually being set.

Calling
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
notifies the framework that the internal state of this object has
changed in a way that might impact the user interface in this subtree,
which causes the framework to schedule a
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
for this `State` object.

If you just change the state directly without calling
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md),
the framework might not schedule a
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
and the user interface for this subtree might not be updated to reflect
the new state.

Generally it is recommended that the
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
method only be used to wrap the actual changes to the state, not any
computation that might be associated with the change. For example, here
a value used by the
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
function is incremented, and then the change is written to disk, but
only the increment is wrapped in the
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md):

``` language-dart
Future<void>  async 
```

Sometimes, the changed state is in some other object not owned by the
widget `State`, but the widget nonetheless needs to be updated to react
to the new state. This is especially common with `Listenable`s, such as
`AnimationController`s.

In such cases, it is good practice to leave a comment in the callback
passed to
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
that explains what state changed:

``` language-dart
void  
//...
animation.addListener(_update);
```

It is an error to call this method after the framework calls
[dispose](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/dispose.md).
You can determine whether it is legal to call this method by checking
whether the
[mounted](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/mounted.md)
property is true. That said, it is better practice to cancel whatever
work might trigger the
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
rather than merely checking for
[mounted](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/mounted.md)
before calling
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md),
as otherwise CPU cycles will be wasted.

## Design discussion

The original version of this API was a method called `markNeedsBuild`,
for consistency with `RenderObject.markNeedsLayout`,
`RenderObject.markNeedsPaint`, *et al*.

However, early user testing of the Flutter framework revealed that
people would call `` much more often than necessary.
Essentially, people used it like a good luck charm, any time they
weren't sure if they needed to call it, they would call it, just in
case.

Naturally, this led to performance issues in applications.

When the API was changed to take a callback instead, this practice was
greatly reduced. One hypothesis is that prompting developers to actually
update their state in a callback caused developers to think more
carefully about what exactly was being updated, and thus improved their
understanding of the appropriate times to call the method.

In practice, the
[setState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/setState.md)
method's implementation is trivial: it calls the provided callback
synchronously, then calls `Element.markNeedsBuild`.

## Performance considerations

There is minimal *direct* overhead to calling this function, and as it
is expected to be called at most once per frame, the overhead is
irrelevant anyway. Nonetheless, it is best to avoid calling this
function redundantly (e.g. in a tight loop), as it does involve creating
a closure and calling it. The method is idempotent, there is no benefit
to calling it more than once per `State` per frame.

The *indirect* cost of causing this function, however, is high: it
causes the widget to rebuild, possibly triggering rebuilds for the
entire subtree rooted at this widget, and further triggering a relayout
and repaint of the entire corresponding `RenderObject` subtree.

For this reason, this method should only be called when the
[build](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState/build.md)
method will, as a result of whatever state change was detected, change
its result meaningfully.

See also:

- `StatefulWidget`, the API documentation for which has a section on
  performance considerations that are relevant here.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@protected
void setState(VoidCallback fn) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manage_members_dialog](../../views_after_auth_screens_chat_widgets_manage_members_dialog/views_after_auth_screens_chat_widgets_manage_members_dialog-library.md)
3.  [ManageMembersDialogState](../../views_after_auth_screens_chat_widgets_manage_members_dialog/ManageMembersDialogState-class.md)
4.  setState method

##### ManageMembersDialogState class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
