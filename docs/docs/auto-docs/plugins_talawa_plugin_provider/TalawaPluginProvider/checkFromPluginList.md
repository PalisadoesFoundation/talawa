::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [plugins/talawa_plugin_provider.dart](../../plugins_talawa_plugin_provider/)
3.  [TalawaPluginProvider](../../plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4.  checkFromPluginList method

::: self-name
checkFromPluginList
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="plugins_talawa_plugin_provider/TalawaPluginProvider-class-sidebar.html" below-sidebar=""}
<div>

# [checkFromPluginList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[checkFromPluginList]{.name}()
:::

::: {.section .desc .markdown}
This function checks if the plugin is insatlled and therefore determine
visibility of the plugin.

**params**: None

**returns**:

-   `bool`: define_the_return
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
bool checkFromPluginList() {
  final UserConfig userConfig = locator<UserConfig>();
  final Box box;
  bool res = false;
  box = Hive.box('pluginBox');
  final List<Map<String, dynamic>> pluginList =
      (box.get('plugins') as List<Map<String, dynamic>>?) ?? [];

  ///mapping over the list from the server
  pluginList.forEach((plugin) {
    if (plugin["pluginName"] == pluginName) {
      res = plugin["pluginInstallStatus"] as bool ||
          (plugin["installedOrgs"] as List)
              .contains(userConfig.currentOrg.id);
    }
  });
  return res;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [talawa_plugin_provider](../../plugins_talawa_plugin_provider/)
3.  [TalawaPluginProvider](../../plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4.  checkFromPluginList method

##### TalawaPluginProvider class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
