::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  navigateToIndividualPage method

::: self-name
navigateToIndividualPage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [navigateToIndividualPage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [navigateToIndividualPage]{.name}(

1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [post]{.parameter-name}]{#navigateToIndividualPage-param-post
    .parameter}

)
:::

::: {.section .desc .markdown}
This function navigate to individual post page..

**params**:

-   `post`: define_the_param

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void navigateToIndividualPage(Post post) {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(Routes.individualPost, arguments: post);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  navigateToIndividualPage method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
