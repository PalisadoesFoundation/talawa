::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [models/post/post_model.dart](../models_post_post_model/)
3.  Post class

::: self-name
Post
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/models_post_post_model-library-sidebar.html" below-sidebar="models_post_post_model/Post-class-sidebar.html"}
<div>

# [Post]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates a Post model.
:::

::: section

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        6)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[Post](../models_post_post_model/Post/Post.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [sId]{.parameter-name}, ]{#-param-sId .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [description]{.parameter-name}, ]{#-param-description .parameter}[[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.type-annotation} [createdAt]{.parameter-name}, ]{#-param-createdAt .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [imageUrl]{.parameter-name}, ]{#-param-imageUrl .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [base64String]{.parameter-name}, ]{#-param-base64String .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [videoUrl]{.parameter-name}, ]{#-param-videoUrl .parameter}[required [[User](../models_user_user_info/User-class.html)?]{.type-annotation} [creator]{.parameter-name}, ]{#-param-creator .parameter}[[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation} [organization]{.parameter-name}, ]{#-param-organization .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [likedBy]{.parameter-name}, ]{#-param-likedBy .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../models_post_post_model/Comments-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [comments]{.parameter-name}]{#-param-comments .parameter}})]{.signature}

:   

[[Post.fromJson](../models_post_post_model/Post/Post.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}]{#fromJson-param-json .parameter})]{.signature}
:   Creating a new Post instance from a map structure.
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[base64String](../models_post_post_model/Post/base64String.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Base64 encoded string of an image attached to the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[comments](../models_post_post_model/Post/comments.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../models_post_post_model/Comments-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   List of comments on the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[createdAt](../models_post_post_model/Post/createdAt.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.signature}
:   Creation timestamp of the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[creator](../models_post_post_model/Post/creator.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)?]{.signature}
:   User who created the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[description](../models_post_post_model/Post/description.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Description of the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[imageUrl](../models_post_post_model/Post/imageUrl.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   URL of the image attached to the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[likedBy](../models_post_post_model/Post/likedBy.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   List of users who liked the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[organization](../models_post_post_model/Post/organization.html)]{.name} [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   Organization associated with the post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[sId](../models_post_post_model/Post/sId.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   unique identifier for post.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[videoUrl](../models_post_post_model/Post/videoUrl.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   URL of a video attached to the post.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[getPostCreatedDuration](../models_post_post_model/Post/getPostCreatedDuration.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   this is to get duration of post.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [post_model](../models_post_post_model/)
3.  Post class

##### post_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
