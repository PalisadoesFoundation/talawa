::::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchDataFromApi]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[fetchDataFromApi]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Abstract method to be implemented by subclasses to fetch data from an
API.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of data fetched from
    the API.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  fetchDataFromApi method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
