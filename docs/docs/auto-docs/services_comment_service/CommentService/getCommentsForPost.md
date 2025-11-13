<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/comment_service.dart](../../services_comment_service/services_comment_service-library.md)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  getCommentsForPost method

<div class="self-name">

getCommentsForPost

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_comment_service/CommentService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getCommentsForPost</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
<span class="type-parameter">dynamic</span>\></span></span>\></span></span>
<span class="name">getCommentsForPost</span>

</div>

<div class="section desc markdown">

This function is used to get comments on the post.

**params**:

- `postId`: The post id for which comments are to be fetched.
- `first`: The number of comments to fetch (default is 10).
- `after`: The cursor for pagination to fetch comments after a specific
  point.
- `last`: The number of comments to fetch from the end (optional).
- `before`: The cursor for pagination to fetch comments before a
  specific point (optional).

**returns**:

- `Future<Map<String, dynamic>>`: A map containing the list of comments
  and pagination information.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<Map<String, dynamic>>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/services_comment_service-library.md)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  getCommentsForPost method

##### CommentService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
