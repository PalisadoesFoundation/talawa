<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/services_comment_service-library.md)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  createComments method

<div class="self-name">

createComments

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_comment_service/CommentService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">createComments</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">createComments</span>(

1.  <span id="createComments-param-postId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">postId</span>, </span>
2.  <span id="createComments-param-body"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">body</span></span>

)

</div>

<div class="section desc markdown">

This function is used to add comment on the post.

To verify things are working, check out the native platform logs.
**params**:

- `postId`: The post id on which comment is to be added.
- `body`: The comment text.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> createComments(String postId, String body) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/services_comment_service-library.md)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  createComments method

##### CommentService class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
