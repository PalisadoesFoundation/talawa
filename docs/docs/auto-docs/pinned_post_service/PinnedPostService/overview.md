# Overview for `PinnedPostService`

## Description

Service to manage pinned posts in the application.

## Dependencies

- BaseFeedManager

## Members

- **_defaultPageSize**: `int`
- **_pinnedPostStreamController**: `dynamic`
- **_pinnedPostStream**: `Stream<List<Post>>`
- **_userConfig**: `dynamic`
- **_dbFunctions**: `dynamic`
- **_currentOrg**: `OrgInfo`
- **_pinnedPosts**: `List<Post>`
- **pinnedPostInfo**: `PageInfo`
  Object to hold pagination information for posts. It contains information like `after`, `before`, `first`, and `last`.

- **after**: `String?`
  `after` is used to fetch posts after a certain cursor.

- **before**: `String?`
  `before` is used to fetch posts before a certain cursor.

- **first**: `int?`
  `first` is used to limit the number of posts fetched in a single request.

- **last**: `int?`
  `last` is used to limit the number of posts fetched so i dont thinkin a single request from the end.

## Constructors

### Unnamed Constructor


