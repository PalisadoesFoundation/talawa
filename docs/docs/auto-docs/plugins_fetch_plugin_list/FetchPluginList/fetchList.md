::::::: {#dartdoc-main-content .main-content above-sidebar="plugins_fetch_plugin_list/FetchPluginList-class-sidebar.html" below-sidebar=""}
<div>

# [fetchList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchList]{.name}()
:::

::: {.section .desc .markdown}
Fetches plugins from server and stores them in Hive `pluginBox`.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> fetchList() async {
  late final GraphQLClient client = graphqlConfig.clientToQuery();
  final QueryResult result = await client.query(
    QueryOptions(
      document: gql(queries.getPluginsList()),
    ),
  );
  box = Hive.box('pluginBox');
  box.put('plugins', result.data?["getPlugins"]);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [fetch_plugin_list](../../plugins_fetch_plugin_list/)
3.  [FetchPluginList](../../plugins_fetch_plugin_list/FetchPluginList-class.html)
4.  fetchList method

##### FetchPluginList class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
