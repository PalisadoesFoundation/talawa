<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/post/post_model.dart](../models_post_post_model/models_post_post_model-library.md)
3.  Post class

<div class="self-name">

Post

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_post_post_model/models_post_post_model-library-sidebar.html"
below-sidebar="models_post_post_model/Post-class-sidebar.html">

<div>

# <span class="kind-class">Post</span> class

</div>

<div class="section desc markdown">

This class creates a Post model.

</div>

<div class="section">

Annotations  
- @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
  6)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Post](../models_post_post_model/Post/Post.md)</span><span class="signature"></span>  

<span class="name">[Post.fromJson](../models_post_post_model/Post/Post.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
Creating a new Post instance from a map structure.

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[attachments](../models_post_post_model/Post/attachments.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[AttachmentModel](../models_attachments_attachment_model/AttachmentModel-class.md)</span>\></span>?</span>  
Attachments associated with the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[caption](../models_post_post_model/Post/caption.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Caption of the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[commentsCount](../models_post_post_model/Post/commentsCount.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
Number of Comments on the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[createdAt](../models_post_post_model/Post/createdAt.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
Creation timestamp of the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[creator](../models_post_post_model/Post/creator.md)</span> <span class="signature">↔ [User](../models_user_user_info/User-class.md)?</span>  
User who created the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[downvotesCount](../models_post_post_model/Post/downvotesCount.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
Number of downvotes on the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasVoted](../models_post_post_model/Post/hasVoted.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Variable to check if post is voted by the user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[id](../models_post_post_model/Post/id.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
unique identifier for post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isPinned](../models_post_post_model/Post/isPinned.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
Variable to check if post is pinned by the user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[organization](../models_post_post_model/Post/organization.md)</span> <span class="signature">↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?</span>  
Organization associated with the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[pinnedAt](../models_post_post_model/Post/pinnedAt.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
Timestamp when the post was pinned.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[upvotesCount](../models_post_post_model/Post/upvotesCount.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
Number of upvotes on the post.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[voteType](../models_post_post_model/Post/voteType.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Variable to check the type of vote on the post by the user (if not voted
then null).

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
this is to get duration of post.

<span class="name">[getPostPinnedDuration](../models_post_post_model/Post/getPostPinnedDuration.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
this is to get duration of pinned post.

<span class="name">[getPresignedUrl](../models_post_post_model/Post/getPresignedUrl.md)</span><span class="signature">(<span id="getPresignedUrl-param-id" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?</span> <span class="parameter-name">id</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to get the presigned URL for a file attachment.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="constants" class="section summary offset-anchor">

## Constants

<span class="name">[fallbackAttachmentUrl](../models_post_post_model/Post/fallbackAttachmentUrl-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Fallback URL for post attachments.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [post_model](../models_post_post_model/models_post_post_model-library.md)
3.  Post class

##### post_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
