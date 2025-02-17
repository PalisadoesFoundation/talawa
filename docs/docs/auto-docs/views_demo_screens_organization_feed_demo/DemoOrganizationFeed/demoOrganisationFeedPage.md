
<div>

# demoOrganisationFeedPage method

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
demoOrganisationFeedPage(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)



function returns a widget that shows the feed of the organization.

**params**:

-   `context`: build context of the widget.

**returns**:

-   `Widget`: returns a widget that shows the feed of the organization.



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
          MainScreenViewModel.scaffoldKey.currentState!.;
        },
      ),
    ),
    // if the model is fetching the data then renders Circular Progress Indicator else renders the result.
    body: ListView(
      shrinkWrap: true,
      children: [
        // If the organization has pinned posts then renders PinnedPostCarousel widget else Container.
        PinnedPost(
          pinnedPost: pinnedPosts.map((map) => Post.fromJson(map)).,
          model: homeModel!,
        ),
        // If the organization has posts then renders PostListWidget widget else Container.
        ,
      ],
    ),
  );
}
```







1.  [talawa](../../index.md)
2.  [organization_feed_demo](../../views_demo_screens_organization_feed_demo/)
3.  [DemoOrganizationFeed](../../views_demo_screens_organization_feed_demo/DemoOrganizationFeed-class.md)
4.  demoOrganisationFeedPage method

##### DemoOrganizationFeed class







