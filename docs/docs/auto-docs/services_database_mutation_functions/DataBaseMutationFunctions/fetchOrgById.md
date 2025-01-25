::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/database_mutation_functions.dart](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  fetchOrgById method

::: self-name
fetchOrgById
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html" below-sidebar=""}
<div>

# [fetchOrgById]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[fetchOrgById]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [id]{.parameter-name}]{#fetchOrgById-param-id .parameter}

)
:::

::: {.section .desc .markdown}
This function fetch the organization using the `id` passed.

**params**:

-   `id`: id that identifies a particular org

**returns**:

-   `Future<dynamic>`: it returns Future of dynamic
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> fetchOrgById(String id) async {
  print(id);
  print(id);
  final QueryResult result = await clientNonAuth
      .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
      result.exception!,
    );
    if (exception!) {
      fetchOrgById(id);
    }
  } else if (result.data != null && result.isConcrete) {
    print(result.data!['organizations']);
    return OrgInfo.fromJson(
      // ignore: collection_methods_unrelated_type
      (result.data!['organizations'] as List<Map<String, dynamic>>)[0],
    );
  }
  return false;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  fetchOrgById method

##### DataBaseMutationFunctions class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
