<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/post_service.dart](../../services_post_service/services_post_service-library.md)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  deletePost method

<div class="self-name">

deletePost

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_post_service/PostService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">deletePost</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">deletePost</span>(

1.  <span id="deletePost-param-post"
    class="parameter"><span class="type-annotation">[Post](../../models_post_post_model/Post-class.md)</span>
    <span class="parameter-name">post</span></span>

)

</div>

<div class="section desc markdown">

Method to delete a post from the feed.

**params**:

- `post`: Post object to be deleted from the feed

**returns**:

- `Future<QueryResult<Object?>>`: returns the result of the GraphQL
  mutation to delete the post.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> deletePost(Post post) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/services_post_service-library.md)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  deletePost method

##### PostService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
