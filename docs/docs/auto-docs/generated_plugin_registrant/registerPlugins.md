:::::: {#dartdoc-main-content .main-content above-sidebar="generated_plugin_registrant/generated_plugin_registrant-library-sidebar.html" below-sidebar=""}
<div>

# [registerPlugins]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [registerPlugins]{.name}(

1.  [[[Registrar](https://api.flutter.dev/flutter/flutter_web_plugins/Registrar-class.html)]{.type-annotation}
    [registrar]{.parameter-name}]{#registerPlugins-param-registrar
    .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void registerPlugins(Registrar registrar) {
  ConnectivityPlusPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UniLinksPlugin.registerWith(registrar);
  VibrationWebPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [generated_plugin_registrant](../generated_plugin_registrant/)
3.  registerPlugins function

##### generated_plugin_registrant library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
