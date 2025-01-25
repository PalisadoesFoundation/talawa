




fetchDataFromApi method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. fetchDataFromApi method

fetchDataFromApi


dark\_mode

light\_mode




# fetchDataFromApi method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
fetchDataFromApi()

## Implementation

```
@override
Future<List<Post>> fetchDataFromApi() async {
  // variables
  final String currentOrgID = _currentOrg.id!;
  final String query =
      PostQueries().getPostsById(currentOrgID, after, before, first, last);
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
  debugPrint(postInfo.toString());
  (posts['edges'] as List).forEach((postJson) {
    final post = Post.fromJson(
      (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
    );
    newPosts.insert(0, post);
  });
  return newPosts;
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. fetchDataFromApi method

##### PostService class





talawa
1.0.0+1






