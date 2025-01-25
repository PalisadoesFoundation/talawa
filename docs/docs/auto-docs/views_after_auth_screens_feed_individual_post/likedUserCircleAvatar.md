::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [views/after_auth_screens/feed/individual_post.dart](../views_after_auth_screens_feed_individual_post/)
3.  likedUserCircleAvatar function

::: self-name
likedUserCircleAvatar
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_feed_individual_post/views_after_auth_screens_feed_individual_post-library-sidebar.html" below-sidebar=""}
<div>

# [likedUserCircleAvatar]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[likedUserCircleAvatar]{.name}(

1.  [[[LikedBy](../models_post_post_model/LikedBy-class.html)]{.type-annotation}
    [user]{.parameter-name}]{#likedUserCircleAvatar-param-user
    .parameter}

)
:::

::: {.section .desc .markdown}
Generates a Circle Avatar representing a user who liked the post.

**params**:

-   `user`: The user who liked the post, represented by the `LikedBy`
    class.

**returns**:

-   `Widget`: Circle Avatar of the user who liked the post.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget likedUserCircleAvatar(LikedBy user) {
  return const Padding(
    padding: EdgeInsets.only(right: 10.0, bottom: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff2f2f2),
          radius: 20,
        ),
        Positioned(
          top: 30,
          right: 0,
          bottom: 20,
          left: 20,
          child: Icon(
            Icons.thumb_up,
            color: Colors.blue,
            size: 20,
          ),
        ),
      ],
    ),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [individual_post](../views_after_auth_screens_feed_individual_post/)
3.  likedUserCircleAvatar function

##### individual_post library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
