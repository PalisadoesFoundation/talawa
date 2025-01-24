




PostService class - post\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/post\_service.dart](../services_post_service/services_post_service-library.html)
3. PostService class

PostService


dark\_mode

light\_mode




# PostService class


PostService class provides functions in the context of a Post.

Services include:

* `getPosts` : to get all posts of the organization.
* `addLike` : to add like to the post.
* `removeLike` : to remove the like from the post.

Inheritance

* Object
* [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)<[Post](../models_post_post_model/Post-class.html)>
* PostService



## Constructors

[PostService](../services_post_service/PostService/PostService.html)()




## Properties

[after](../services_post_service/PostService/after.html)
↔ String?

getter/setter pair

[before](../services_post_service/PostService/before.html)
↔ String?

getter/setter pair

[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)
→ String

feed cacheBox key.
finalinherited

[first](../services_post_service/PostService/first.html)
↔ int?

getter/setter pair

[hashCode](../services_caching_base_feed_manager/BaseFeedManager/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[last](../services_post_service/PostService/last.html)
↔ int?

getter/setter pair

[postInfo](../services_post_service/PostService/postInfo.html)
↔ Map<String, dynamic>?

getter/setter pair

[postStream](../services_post_service/PostService/postStream.html)
→ Stream<List<[Post](../models_post_post_model/Post-class.html)>>

Getter for Stream of posts.
no setter

[runtimeType](../services_caching_base_feed_manager/BaseFeedManager/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[updatedPostStream](../services_post_service/PostService/updatedPostStream.html)
→ Stream<[Post](../models_post_post_model/Post-class.html)>

Getter for Stream of update in any post.
no setter



## Methods

[addCommentLocally](../services_post_service/PostService/addCommentLocally.html)(String postID)
→ void


Method to add comment of a user and update comments using updated Post Stream.

[addLike](../services_post_service/PostService/addLike.html)(String postID)
→ Future<bool>


Method to add like on a Post.

[addNewpost](../services_post_service/PostService/addNewpost.html)([Post](../models_post_post_model/Post-class.html) newPost)
→ void


Method to add newly created post at the very top of the feed.

[deletePost](../services_post_service/PostService/deletePost.html)([Post](../models_post_post_model/Post-class.html) post)
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>



[fetchDataFromApi](../services_post_service/PostService/fetchDataFromApi.html)()
→ Future<List<[Post](../models_post_post_model/Post-class.html)>>


Abstract method to be implemented by subclasses to fetch data from an API.
override

[fetchPostsInitial](../services_post_service/PostService/fetchPostsInitial.html)()
→ Future<void>



[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)()
→ Future<List<[Post](../models_post_post_model/Post-class.html)>>


Fetches new data from the API if online, updates the cache, and returns the data.
inherited

[getPosts](../services_post_service/PostService/getPosts.html)()
→ Future<void>


Method used to fetch all posts of the current organisation.

[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)()
→ Future<List<[Post](../models_post_post_model/Post-class.html)>>


Loads the data cached in Hive.
inherited

[nextPage](../services_post_service/PostService/nextPage.html)()
→ Future<void>


Method to handle pagination by fetching next page of posts.

[noSuchMethod](../services_caching_base_feed_manager/BaseFeedManager/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[previousPage](../services_post_service/PostService/previousPage.html)()
→ Future<void>


Method to handle pagination by fetching previous page of posts.

[refreshFeed](../services_post_service/PostService/refreshFeed.html)()
→ Future<void>


Method to refresh feed of current selected organisation.

[removeLike](../services_post_service/PostService/removeLike.html)(String postID)
→ Future<bool>


Method to remove like in a Post.

[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)(List<[Post](../models_post_post_model/Post-class.html)> data)
→ Future<void>


Saves a list of data to the cache, replacing any existing data.
inherited

[setOrgStreamSubscription](../services_post_service/PostService/setOrgStreamSubscription.html)()
→ void


This method sets up a stream that constantly listens to change in current org.

[toString](../services_caching_base_feed_manager/BaseFeedManager/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_caching_base_feed_manager/BaseFeedManager/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [post\_service](../services_post_service/services_post_service-library.html)
3. PostService class

##### post\_service library





talawa
1.0.0+1






