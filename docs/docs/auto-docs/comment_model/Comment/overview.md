# Overview for `Comment`

## Description

This class returns a Comment instance.

## Members

- **id**: `String?`
  id of the comment.

- **body**: `String?`
  The text of the comment.

- **createdAt**: `String?`
  The creation date of the comment.

- **creator**: `User?`
  The creator of the comment.

- **post**: `Post?`
  The post associated with the comment.

- **hasVoted**: `bool?`
  Variable to check if post is voted by the user.

- **upvotesCount**: `int?`
  Number of upvotes on the comment.

- **downvotesCount**: `int?`
  Number of downvotes on the comment.

- **voteType**: `VoteType?`
  Variable to check the type of vote on the comment by the user (if not voted then null).

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map<String, dynamic>`
