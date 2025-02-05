


# addNewPost method








void addNewPost
([Post](../../models_post_post_model/Post-class.md) newPost)





<p>This function adds new Post.</p>
<p>params:</p>
<ul>
<li>```dartnewPost```</li>
</ul>



## Implementation

```dart
void addNewPost(Post newPost) \{
  _posts.insert(0, newPost);
  notifyListeners();
\}
```







