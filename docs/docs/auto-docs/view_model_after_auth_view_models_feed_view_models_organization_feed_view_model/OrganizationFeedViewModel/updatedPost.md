


# updatedPost method








void updatedPost
([Post](../../models_post_post_model/Post-class.md) post)





<p>This function updates the post.</p>
<p>params:</p>
<ul>
<li><code>post</code></li>
</ul>



## Implementation

```dart
void updatedPost(Post post) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == post.sId) {
      _posts[i] = post;
      notifyListeners();
      break;
    }
  }
}
```







