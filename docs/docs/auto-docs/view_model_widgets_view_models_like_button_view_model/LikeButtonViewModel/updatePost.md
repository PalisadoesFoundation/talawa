


# updatePost method








void updatePost
([Post](../../models_post_post_model/Post-class.md) post)





<p>This function updates the Post.</p>
<p>params:
<code>post</code> : <code>Post</code> type, the post that need to be updated.</p>



## Implementation

```dart
void updatePost(Post post) {
  if (_postID == post.sId) {
    _likedBy = post.likedBy!;
    checkAndSetTheIsLiked();
  }
}
```







