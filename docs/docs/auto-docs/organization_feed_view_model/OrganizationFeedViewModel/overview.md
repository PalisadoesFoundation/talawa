# Overview for `OrganizationFeedViewModel`

## Description

OrganizationFeedViewModel class helps to interact with model to serve data to view for organization feed section.

 Methods include:
 * `setCurrentOrganizationName` : to set current organization name.
 * `fetchNewPosts` : to fetch new posts in the organization.
 * `navigateToIndividualPage` : to navigate to individual page.
 * `navigateToPinnedPostPage` : to navigate to pinned post page.
 * `addNewPost` : to add new post in the organization.
 * `updatedPost` : to update a post in the organization.

## Dependencies

- BaseModel

## Members

- **_posts**: `List&lt;Post&gt;`
- **_userPosts**: `List&lt;Post&gt;`
- **_pinnedPosts**: `List&lt;Post&gt;`
- **_renderedPostID**: `Set&lt;String&gt;`
- **_currentOrgName**: `String`
- **_navigationService**: `NavigationService`
- **_userConfig**: `UserConfig`
- **_postService**: `PostService`
- **_pinnedPostService**: `PinnedPostService`
- **_currentOrganizationStreamSubscription**: `StreamSubscription`
- **_postsSubscription**: `StreamSubscription`
- **_updatePostSubscription**: `StreamSubscription`
- **_pinnnedPostSubscription**: `StreamSubscription`
- **_isFetchingPosts**: `bool`
