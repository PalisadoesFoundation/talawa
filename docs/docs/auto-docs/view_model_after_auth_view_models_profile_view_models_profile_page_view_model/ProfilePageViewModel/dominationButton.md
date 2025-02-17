::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [dominationButton]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[dominationButton]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [amount]{.parameter-name}, ]{#dominationButton-param-amount
    .parameter}
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#dominationButton-param-context
    .parameter}
3.  [[void]{.type-annotation}
    [setter]{.parameter-name}(]{#dominationButton-param-setter
    .parameter}
    1.  [[void]{.type-annotation} []{.parameter-name}()]{#param-
        .parameter}

    )

)
:::

::: {.section .desc .markdown}
This widget returns button for domination.

**params**:

-   `amount`: donation Amount.
-   `context`: BuildContext.
-   `setter`: `Function` type, which on tap set the amount to
    `donationAmount`.

**returns**:

-   `Widget`: Icon Button
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget dominationButton(
  String amount,
  BuildContext context,
  void Function(void Function()) setter,
) {
  return InkWell(
    key: Key('domBtn_$amount'),
    onTap: () {
      setter(() {
        donationAmount.text = amount;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight! * 0.02,
        horizontal: SizeConfig.screenWidth! * 0.075,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: donationAmount.text == amount
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        '$donationCurrencySymbol $amount',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ),
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  dominationButton method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
