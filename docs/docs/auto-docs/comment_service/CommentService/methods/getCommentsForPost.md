# Method: `getCommentsForPost`

## Description

This function is used to get comments on the post.

 **params**:
 * `postId`: The post id for which comments are to be fetched.
 * `first`: The number of comments to fetch (default is 10).
 * `after`: The cursor for pagination to fetch comments after a specific point.
 * `last`: The number of comments to fetch from the end (optional).
 * `before`: The cursor for pagination to fetch comments before a specific point (optional).

 **returns**:
 * `Future&lt;Map&lt;String, dynamic&gt;&gt;`: A map containing the list of comments and pagination information.

## Return Type
`Future&lt;Map&lt;String, dynamic&gt;&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
