
<div>

# fetchDataFromApi method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../../models_post_post_model/Post-class.html)]\>]]\>]]



override




Abstract method to be implemented by subclasses to fetch data from an
API.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of data fetched from
    the API.



## Implementation

``` language-dart
@override
Future<List<Post>>  async {
  // variables
  final String currentOrgID = _currentOrg.id!;
  final String query =
      .getPostsById(currentOrgID, after, before, first, last);
  final result = await _dbFunctions.gqlAuthQuery(query);
  //Checking if the dbFunctions return the postJSON, if not return.
  if (result.data == null) {
    // Handle the case where the result or result.data is null
    throw Exception('unable to fetch data');
  }

  final organizations = result.data!['organizations'] as List;
  final Map<String, dynamic> posts = (organizations[0]
      as Map<String, dynamic>)['posts'] as Map<String, dynamic>;
  final List<Post> newPosts = [];
  postInfo = posts['pageInfo'] as Map<String, dynamic>;
  debugPrint(postInfo.);
  (posts['edges'] as List).forEach((postJson) {
    final post = Post.fromJson(
      (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
    );
    newPosts.insert(0, post);
  });
  return newPosts;
}
```







1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  fetchDataFromApi method

##### PostService class







