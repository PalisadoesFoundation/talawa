:::::: {#dartdoc-main-content .main-content above-sidebar="view_model_base_view_model/BaseModel-class-sidebar.html" below-sidebar=""}
<div>

# [setState]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setState]{.name}(

1.  [[[ViewState](../../enums_enums/ViewState.html)]{.type-annotation}
    [viewState]{.parameter-name}]{#setState-param-viewState .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setState(ViewState viewState) {
  _state = viewState;
  notifyListeners();
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [base_view_model](../../view_model_base_view_model/)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.html)
4.  setState method

##### BaseModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
