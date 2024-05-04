


# getPosts method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getPosts
()





<p>This function used to get all posts of an organization.
The function reference the organization Id from <code>_currentOrg</code>.</p>



## Implementation

```dart
Future<void> getPosts() async {
  // variables
  final String currentOrgID = _currentOrg.id!;
  final String query = PostQueries().getPostsById(currentOrgID);
  final result = await _dbFunctions.gqlAuthQuery(query);

  //Checking if the dbFunctions return the postJSON, if not return.
  if (result.data!['postsByOrganization'] == null) return;

  final List postsJson = result.data!['postsByOrganization'] as List;

  postsJson.forEach((postJson) {
    final Post post = Post.fromJson(postJson as Map<String, dynamic>);
    if (!_renderedPostID.contains(post.sId)) {
      _posts.insert(0, post);
      _renderedPostID.add(post.sId);
    }
  });
  _postStreamController.add(_posts);
}
```







