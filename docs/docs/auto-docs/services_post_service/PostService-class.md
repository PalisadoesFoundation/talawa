<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/post_service.dart](../services_post_service/)
3.  PostService class

<div class="self-name">

PostService

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_post_service/services_post_service-library-sidebar.html"
below-sidebar="services_post_service/PostService-class-sidebar.html">

<div>

# <span class="kind-class">PostService</span> class

</div>

<div class="section desc markdown">

PostService class provides functions in the context of a Post.

Services include:

- `getPosts` : to get all posts of the organization.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.md)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span>
- PostService

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[PostService](../services_post_service/PostService/PostService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[after](../services_post_service/PostService/after.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
`after` is used to fetch posts after a certain cursor.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[before](../services_post_service/PostService/before.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
`before` is used to fetch posts before a certain cursor.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
feed cacheBox key.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[currentOrg](../services_post_service/PostService/currentOrg.md)</span> <span class="signature">→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
Getter for the current organization.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[first](../services_post_service/PostService/first.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
`first` is used to limit the number of posts fetched in a single
request.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[last](../services_post_service/PostService/last.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
`last` is used to limit the number of posts fetched in a single request
from the end.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[pageInfo](../services_post_service/PostService/pageInfo.md)</span> <span class="signature">↔ [PageInfo](../models_page_info_page_info/PageInfo-class.md)</span>  
Object to hold pagination information for posts. It contains information
like `after`, `before`, `first`, and `last`.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[posts](../services_post_service/PostService/posts.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>  
Getter for the list of posts.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[postStream](../services_post_service/PostService/postStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span>  
Getter for Stream of posts.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[updatedPostStream](../services_post_service/PostService/updatedPostStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>  
Getter for Stream of update in any post.

<div class="features">

<span class="feature">no setter</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addCommentLocally](../services_post_service/PostService/addCommentLocally.md)</span><span class="signature">(<span id="addCommentLocally-param-postID" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">postID</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to add comment of a user and update comments using updated Post
Stream.

<span class="name">[addNewpost](../services_post_service/PostService/addNewpost.md)</span><span class="signature">(<span id="addNewpost-param-newPost" class="parameter"><span class="type-annotation">[Post](../models_post_post_model/Post-class.md)</span> <span class="parameter-name">newPost</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to add newly created post at the very top of the feed.

<span class="name">[deletePost](../services_post_service/PostService/deletePost.md)</span><span class="signature">(<span id="deletePost-param-post" class="parameter"><span class="type-annotation">[Post](../models_post_post_model/Post-class.md)</span> <span class="parameter-name">post</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
Method to delete a post from the feed.

<span class="name">[fetchAndSetUserVoteStatus](../services_post_service/PostService/fetchAndSetUserVoteStatus.md)</span><span class="signature">(<span id="fetchAndSetUserVoteStatus-param-post" class="parameter"><span class="type-annotation">[Post](../models_post_post_model/Post-class.md)</span> <span class="parameter-name">post</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to fetch and set the user's vote status for a post.

<span class="name">[fetchDataFromApi](../services_post_service/PostService/fetchDataFromApi.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Abstract method to be implemented by subclasses to fetch data from an
API.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[fetchPostsInitial](../services_post_service/PostService/fetchPostsInitial.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to load cached data from Hive database.

<span class="name">[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Fetches new data from the API if online, updates the cache, and returns
the data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[getPosts](../services_post_service/PostService/getPosts.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method used to fetch all posts of the current organisation.

<span class="name">[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Loads the data cached in Hive.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[nextPage](../services_post_service/PostService/nextPage.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to handle pagination by fetching next page of posts.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[previousPage](../services_post_service/PostService/previousPage.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to handle pagination by fetching previous page of posts.

<span class="name">[refreshFeed](../services_post_service/PostService/refreshFeed.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to refresh feed of current selected organisation.

<span class="name">[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.md)</span><span class="signature">(<span id="saveDataToCache-param-data" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span> <span class="parameter-name">data</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Saves a list of data to the cache, replacing any existing data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setOrgStreamSubscription](../services_post_service/PostService/setOrgStreamSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This method sets up a stream that constantly listens to change in
current org.

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

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [post_service](../services_post_service/)
3.  PostService class

##### post_service library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
