::::::: {#dartdoc-main-content .main-content above-sidebar="views_demo_screens_organization_feed_demo/DemoOrganizationFeed-class-sidebar.html" below-sidebar=""}
<div>

# [demoOrganisationFeedPage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[demoOrganisationFeedPage]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#demoOrganisationFeedPage-param-context
    .parameter}

)
:::

::: {.section .desc .markdown}
function returns a widget that shows the feed of the organization.

**params**:

-   `context`: build context of the widget.

**returns**:

-   `Widget`: returns a widget that shows the feed of the organization.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget demoOrganisationFeedPage(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      // AppBar returns a widget for the header of the page.
      backgroundColor: Colors.green,
      // Theme.of(context).primaryColor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.strictTranslate("Organisation Name"),
        key: homeModel?.keySHOrgName,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
      ),
      leading: IconButton(
        key: homeModel?.keySHMenuIcon,
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {
          MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
        },
      ),
    ),
    // if the model is fetching the data then renders Circular Progress Indicator else renders the result.
    body: ListView(
      shrinkWrap: true,
      children: [
        // If the organization has pinned posts then renders PinnedPostCarousel widget else Container.
        PinnedPost(
          pinnedPost: pinnedPosts.map((map) => Post.fromJson(map)).toList(),
          model: homeModel!,
        ),
        // If the organization has posts then renders PostListWidget widget else Container.
        Container(),
      ],
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
2.  [organization_feed_demo](../../views_demo_screens_organization_feed_demo/)
3.  [DemoOrganizationFeed](../../views_demo_screens_organization_feed_demo/DemoOrganizationFeed-class.html)
4.  demoOrganisationFeedPage method

##### DemoOrganizationFeed class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
