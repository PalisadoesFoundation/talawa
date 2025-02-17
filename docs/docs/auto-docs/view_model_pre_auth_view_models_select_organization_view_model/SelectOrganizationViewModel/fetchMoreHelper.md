::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchMoreHelper]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [fetchMoreHelper]{.name}(

1.  [[[FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation}
    [fetchMore]{.parameter-name}, ]{#fetchMoreHelper-param-fetchMore
    .parameter}
2.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]{.type-annotation}
    [organizations]{.parameter-name}]{#fetchMoreHelper-param-organizations
    .parameter}

)
:::

::: {.section .desc .markdown}
This function fetch more option.

**params**:

-   `fetchMore`: client function
-   `organizations`: org list

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void fetchMoreHelper(FetchMore fetchMore, List organizations) {
  fetchMore(
    FetchMoreOptions(
      variables: {
        "first": organizations.length + 15,
        "skip": organizations.length,
      },
      updateQuery: (existingOrganizations, newOrganizations) {
        return {
          'organizationsConnection':
              (existingOrganizations!["organizationsConnection"]
                      as List<Object?>) +
                  (newOrganizations!['organizationsConnection']
                      as List<dynamic>),
        };
      },
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
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  fetchMoreHelper method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
