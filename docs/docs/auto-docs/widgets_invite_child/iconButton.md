::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_invite_child/widgets_invite_child-library-sidebar.html" below-sidebar=""}
<div>

# [iconButton]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[iconButton]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [key]{.parameter-name}, ]{#iconButton-param-key .parameter}
2.  [[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-annotation}
    [icon]{.parameter-name}, ]{#iconButton-param-icon .parameter}
3.  [[void]{.type-annotation}
    [onTap]{.parameter-name}()]{#iconButton-param-onTap .parameter}

)
:::

::: {.section .desc .markdown}
It prints \"tapped\" in the console for the developer to know that the
button was tapped.

**params**:

-   `key`: Key of the Widget
-   `icon`: Icon to be displayed
-   `onTap`: on tap function

**returns**:

-   `Widget`: returns IconButton.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget iconButton(String key, Widget icon, void Function() onTap) {
  return Stack(
    children: [
      IconButton(
        key: Key(key),
        onPressed: () {
          print('tapped');
          onTap();
        },
        icon: icon,
      ),
    ],
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [invite_child](../widgets_invite_child/)
3.  iconButton function

##### invite_child library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
