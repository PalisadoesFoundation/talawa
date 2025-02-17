::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_member_name_tile/MemberNameTile-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s
[build](../../widgets_member_name_tile/MemberNameTile/build.html) method
is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 5),
    child: Container(
      width: SizeConfig.screenWidth! * (0.3 + userName.length / 50),
      height: SizeConfig.screenHeight! * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.02),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Background is set with the image uploaded by the user.
          userImage != null
              ? CircleAvatar(
                  radius: SizeConfig.screenHeight! * 0.0201,
                  backgroundImage: NetworkImage(userImage!),
                )
              // If the user has not uploaded his/her image,
              // then a circle avatar is created.
              // It has the first character of the user's name
              //in uppercase and the default background color.
              : CircleAvatar(
                  radius: SizeConfig.screenHeight! * 0.0201,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    userName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
          // The name of the member in text form.
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              userName,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => onDelete(),
            icon: const Icon(
              Icons.cancel_rounded,
              color: Color(0xff524F4F),
              size: 19,
            ),
          ),
        ],
      ),
    ),
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [member_name_tile](../../widgets_member_name_tile/)
3.  [MemberNameTile](../../widgets_member_name_tile/MemberNameTile-class.html)
4.  build method

##### MemberNameTile class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
