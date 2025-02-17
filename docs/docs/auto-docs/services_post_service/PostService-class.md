:::::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/services_post_service-library-sidebar.html" below-sidebar="services_post_service/PostService-class-sidebar.html"}
<div>

# [PostService]{.kind-class} class

</div>

::: {.section .desc .markdown}
PostService class provides functions in the context of a Post.

Services include:

-   `getPosts` : to get all posts of the organization.
-   `addLike` : to add like to the post.
-   `removeLike` : to remove the like from the post.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}
    -   PostService
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[PostService](../services_post_service/PostService/PostService.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[after](../services_post_service/PostService/after.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[before](../services_post_service/PostService/before.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   feed cacheBox key.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[first](../services_post_service/PostService/first.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[last](../services_post_service/PostService/last.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[postInfo](../services_post_service/PostService/postInfo.html)]{.name} [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[postStream](../services_post_service/PostService/postStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for Stream of posts.
    ::: features
    [no setter]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[updatedPostStream](../services_post_service/PostService/updatedPostStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for Stream of update in any post.
    ::: features
    [no setter]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addCommentLocally](../services_post_service/PostService/addCommentLocally.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [postID]{.parameter-name}]{#addCommentLocally-param-postID .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to add comment of a user and update comments using updated
    Post Stream.

[[addLike](../services_post_service/PostService/addLike.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [postID]{.parameter-name}]{#addLike-param-postID .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to add like on a Post.

[[addNewpost](../services_post_service/PostService/addNewpost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [newPost]{.parameter-name}]{#addNewpost-param-newPost .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to add newly created post at the very top of the feed.

[[deletePost](../services_post_service/PostService/deletePost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [post]{.parameter-name}]{#deletePost-param-post .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}

:   

[[fetchDataFromApi](../services_post_service/PostService/fetchDataFromApi.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Abstract method to be implemented by subclasses to fetch data from
    an API.
    ::: features
    [override]{.feature}
    :::

[[fetchPostsInitial](../services_post_service/PostService/fetchPostsInitial.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}

:   

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches new data from the API if online, updates the cache, and
    returns the data.
    ::: features
    [inherited]{.feature}
    :::

[[getPosts](../services_post_service/PostService/getPosts.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method used to fetch all posts of the current organisation.

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Loads the data cached in Hive.
    ::: features
    [inherited]{.feature}
    :::

[[nextPage](../services_post_service/PostService/nextPage.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to handle pagination by fetching next page of posts.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[previousPage](../services_post_service/PostService/previousPage.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to handle pagination by fetching previous page of posts.

[[refreshFeed](../services_post_service/PostService/refreshFeed.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to refresh feed of current selected organisation.

[[removeLike](../services_post_service/PostService/removeLike.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [postID]{.parameter-name}]{#removeLike-param-postID .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to remove like in a Post.

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [data]{.parameter-name}]{#saveDataToCache-param-data .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Saves a list of data to the cache, replacing any existing data.
    ::: features
    [inherited]{.feature}
    :::

[[setOrgStreamSubscription](../services_post_service/PostService/setOrgStreamSubscription.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This method sets up a stream that constantly listens to change in
    current org.

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
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [post_service](../services_post_service/)
3.  PostService class

##### post_service library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
