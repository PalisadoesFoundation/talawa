::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  attachListener method

::: self-name
attachListener
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [attachListener]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [attachListener]{.name}(

1.  [[void]{.type-annotation}
    [setter]{.parameter-name}(]{#attachListener-param-setter .parameter}
    1.  [[void]{.type-annotation} []{.parameter-name}()]{#param-
        .parameter}

    )

)
:::

::: {.section .desc .markdown}
This widget returns button for domination.

**params**:

-   `setter`: SetState holder.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void attachListener(void Function(void Function()) setter) {
  donationField.addListener(() {
    if (donationField.hasFocus) {
      setter(() {
        bottomSheetHeight = SizeConfig.screenHeight! * 0.8725;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        {
          setter(() {
            bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
          });
        }
      });
    }
  });
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
4.  attachListener method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
