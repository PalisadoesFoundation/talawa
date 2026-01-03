# Overview for `CommentsViewModel`

## Description

CommentsViewModel class helps to serve the data from model and to react to user's input for Comment Widget.

 Methods include:
 * `getComments` : to get all comments on the post.
 * `createComment` : to add comment on the post.

## Dependencies

- BaseModel

## Members

- **_commentService**: `CommentService`
  Constructor

- **_postService**: `PostService`
  PostService instance.

- **post**: `Post`
  Post on which comments are to be fetched.

- **_commentlist**: `List<Comment>`
  List of comments on the post.

- **pageInfo**: `PageInfo`
  page Info of the current comments.

