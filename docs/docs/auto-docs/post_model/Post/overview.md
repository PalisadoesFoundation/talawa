# Overview for `Post`

## Description

This class creates a Post model.

## Members

- **id**: `String?`
  unique identifier for post.

- **caption**: `String?`
  Caption of the post.

- **commentsCount**: `int?`
  Number of Comments on the post.

- **upvotesCount**: `int?`
  Number of upvotes on the post.

- **attachments**: `List<AttachmentModel>?`
  Attachments associated with the post.

- **createdAt**: `DateTime?`
  Creation timestamp of the post.

- **creator**: `User?`
  User who created the post.

- **hasVoted**: `bool?`
  Variable to check if post is voted by the user.

- **voteType**: `VoteType?`
  Variable to check the type of vote on the post by the user (if not voted then null).

- **organization**: `OrgInfo?`
  Organization associated with the post.

- **isPinned**: `bool?`
  Variable to check if post is pinned by the user.

- **pinnedAt**: `DateTime?`
  Timestamp when the post was pinned.

- **downvotesCount**: `int?`
  Number of downvotes on the post.

- **_imageService**: `ImageService`
  Image service instance to handle file operations

## Constructors

### Unnamed Constructor


### fromJson
Creating a new Post instance from a map structure.

 params:
 None
 returns:
 * `PostObject`: Dart Object for posts

#### Parameters

- `json`: `Map<String, dynamic>`
