::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [main.dart](../main/)
3.  main function

::: self-name
main
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="main/main-library-sidebar.html" below-sidebar=""}
<div>

# [main]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[main]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await path.getApplicationDocumentsDirectory();

  await HiveManager.initializeHive(dir: dir);

  setupLocator();

  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [main](../main/)
3.  main function

##### main library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
