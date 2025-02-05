


# buildNewPosts method








void buildNewPosts
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Post](../../models_post_post_model/Post-class.md)> newPosts)





<p>This function initialise ```dart_posts``` with ```dartnewPosts```.</p>
<p>params:</p>
<ul>
<li>```dartnewPosts```</li>
</ul>



## Implementation

```dart
void buildNewPosts(List<Post> newPosts) \{
  _posts = newPosts;
  notifyListeners();
\}
```







