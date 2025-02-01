::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  iconButton method

::: self-name
iconButton
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [iconButton]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[iconButton]{.name}(

1.  [[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-annotation}
    [icon]{.parameter-name}, ]{#iconButton-param-icon .parameter}
2.  [[void]{.type-annotation}
    [onTap]{.parameter-name}()]{#iconButton-param-onTap .parameter}

)
:::

::: {.section .desc .markdown}
This widget returns the button for social media sharing option.

**params**:

-   `icon`: This is Widget type with icon details.
-   `onTap`: This is Function which invoke on tap.

**returns**:

-   `Widget`: Icon Button
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget iconButton(Widget icon, void Function() onTap) {
  return Stack(
    children: [
      IconButton(
        key: const Key('iconbtn1'),
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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  iconButton method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
