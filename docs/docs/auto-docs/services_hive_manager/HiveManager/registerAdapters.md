::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/hive_manager.dart](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapters static method

::: self-name
registerAdapters
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/HiveManager-class-sidebar.html" below-sidebar=""}
<div>

# [registerAdapters]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[registerAdapters]{.name}()
:::

::: {.section .desc .markdown}
Registers the necessary Hive adapters for the models used in the
application.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static Future<void> registerAdapters() async {
  registerAdapter<User>(UserAdapter());
  registerAdapter<OrgInfo>(OrgInfoAdapter());
  registerAdapter<AsymetricKeys>(AsymetricKeysAdapter());
  registerAdapter<CachedUserAction>(CachedUserActionAdapter());
  registerAdapter<CachedOperationType>(CachedOperationTypeAdapter());
  registerAdapter<CachedUserActionStatus>(CachedUserActionStatusAdapter());
  registerAdapter<Post>(PostAdapter());
  registerAdapter<Event>(EventAdapter());
  registerAdapter<LikedBy>(LikedByAdapter());
  registerAdapter<Attendee>(AttendeeAdapter());
  registerAdapter<Comment>(CommentAdapter());
  registerAdapter<Comments>(CommentsAdapter());
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapters static method

##### HiveManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
