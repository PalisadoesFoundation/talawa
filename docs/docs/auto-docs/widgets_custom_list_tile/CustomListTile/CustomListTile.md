::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/custom_list_tile.dart](../../widgets_custom_list_tile/)
3.  [CustomListTile](../../widgets_custom_list_tile/CustomListTile-class.html)
4.  CustomListTile const constructor

::: self-name
CustomListTile
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_custom_list_tile/CustomListTile-class-sidebar.html" below-sidebar=""}
<div>

# [CustomListTile]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
const [CustomListTile]{.name}({

1.  [required
    [[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)]{.type-annotation}
    [key]{.parameter-name}, ]{#-param-key .parameter}
2.  [required
    [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [index]{.parameter-name}, ]{#-param-index .parameter}
3.  [required
    [[TileType](../../enums_enums/TileType.html)]{.type-annotation}
    [type]{.parameter-name}, ]{#-param-type .parameter}
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [showIcon]{.parameter-name} = [false]{.default-value},
    ]{#-param-showIcon .parameter}
5.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation}
    [orgInfo]{.parameter-name}, ]{#-param-orgInfo .parameter}
6.  [[[User](../../models_user_user_info/User-class.html)?]{.type-annotation}
    [userInfo]{.parameter-name}, ]{#-param-userInfo .parameter}
7.  [[[Attendee](../../models_events_event_model/Attendee-class.html)?]{.type-annotation}
    [attendeeInfo]{.parameter-name}, ]{#-param-attendeeInfo .parameter}
8.  [[[Options](../../models_options_options/Options-class.html)?]{.type-annotation}
    [option]{.parameter-name}, ]{#-param-option .parameter}
9.  [[dynamic]{.type-annotation}
    [onTapOrgInfo]{.parameter-name}(]{#-param-onTapOrgInfo .parameter}
    1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}]{#param-
        .parameter}

    )?,
10. [[dynamic]{.type-annotation} [onTapUserInfo]{.parameter-name}()?,
    ]{#-param-onTapUserInfo .parameter}
11. [[dynamic]{.type-annotation}
    [onTapAttendeeInfo]{.parameter-name}()?, ]{#-param-onTapAttendeeInfo
    .parameter}
12. [[dynamic]{.type-annotation} [onTapOption]{.parameter-name}()?,
    ]{#-param-onTapOption .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
const CustomListTile({
  required Key key,
  required this.index,
  required this.type,
  this.showIcon = false,
  this.orgInfo,
  this.userInfo,
  this.attendeeInfo,
  this.option,
  this.onTapOrgInfo,
  this.onTapUserInfo,
  this.onTapAttendeeInfo,
  this.onTapOption,
}) : super(key: key);
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_list_tile](../../widgets_custom_list_tile/)
3.  [CustomListTile](../../widgets_custom_list_tile/CustomListTile-class.html)
4.  CustomListTile const constructor

##### CustomListTile class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
