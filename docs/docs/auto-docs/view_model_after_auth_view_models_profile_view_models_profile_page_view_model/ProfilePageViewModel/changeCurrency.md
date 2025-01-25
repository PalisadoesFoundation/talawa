::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  changeCurrency method

::: self-name
changeCurrency
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [changeCurrency]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [changeCurrency]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#changeCurrency-param-context
    .parameter}
2.  [[void]{.type-annotation}
    [setter]{.parameter-name}(]{#changeCurrency-param-setter .parameter}
    1.  [[void]{.type-annotation} []{.parameter-name}()]{#param-
        .parameter}

    )

)
:::

::: {.section .desc .markdown}
This method changes the currency of the user for donation purpose.

**params**:

-   `context`: BuildContext of the widget
-   `setter`: Setter Function

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void changeCurrency(
  BuildContext context,
  void Function(void Function()) setter,
) {
  showCurrencyPicker(
    context: context,
    currencyFilter: supportedCurrencies,
    onSelect: (Currency currency) {
      setter(() {
        donationCurrency = currency.code;
        donationCurrencySymbol = currency.symbol;
      });
    },
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
4.  changeCurrency method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
