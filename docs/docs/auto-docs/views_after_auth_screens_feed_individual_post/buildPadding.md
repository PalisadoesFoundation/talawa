::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [views/after_auth_screens/feed/individual_post.dart](../views_after_auth_screens_feed_individual_post/)
3.  buildPadding function

::: self-name
buildPadding
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_feed_individual_post/views_after_auth_screens_feed_individual_post-library-sidebar.html" below-sidebar=""}
<div>

# [buildPadding]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)]{.returntype}
[buildPadding]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#buildPadding-param-context
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [text]{.parameter-name}]{#buildPadding-param-text .parameter}

)
:::

::: {.section .desc .markdown}
Generates a `Padding` widget with customizable vertical padding around a
text element.

**params**:

-   `context`: The build context in which the padding method is called.
-   `text`: The text on which padding should be applied.

**returns**:

-   `Padding`: Padding widget with vertical padding applied to the
    provided text.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Padding buildPadding(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.006),
    child: Text(
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [individual_post](../views_after_auth_screens_feed_individual_post/)
3.  buildPadding function

##### individual_post library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
