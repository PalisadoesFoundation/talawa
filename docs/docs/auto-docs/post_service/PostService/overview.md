# Overview for `PostService`

## Description

PostService class provides functions in the context of a Post.

 Services include:
 * `getPosts` : to get all posts of the organization.

## Dependencies

- BaseFeedManager

## Members

- **_postStreamController**: `StreamController<List<Post>>`
- **_postStream**: `Stream<List<Post>>`
- **_updatedPostStreamController**: `StreamController<Post>`
- **_updatedPostStream**: `Stream<Post>`
- **_userConfig**: `dynamic`
- **_dbFunctions**: `dynamic`
- **_currentOrg**: `OrgInfo`
- **_renderedPostID**: `Set<String>`
- **_posts**: `List<Post>`
- **_isRefreshing**: `bool`
- **pageInfo**: `PageInfo`
  Object to hold pagination information for posts. It contains information like `after`, `before`, `first`, and `last`.

- **after**: `String?`
  `after` is used to fetch posts after a certain cursor.

- **before**: `String?`
  `before` is used to fetch posts before a certain cursor.

- **first**: `int?`
  `first` is used to limit the number of posts fetched in a single request.

- **last**: `int?`
  `last` is used to limit the number of posts fetched in a single request from the end.

## Constructors

### Unnamed Constructor


