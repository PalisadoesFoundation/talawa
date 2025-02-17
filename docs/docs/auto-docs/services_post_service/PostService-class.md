
<div>

# PostService class

</div>


PostService class provides functions in the context of a Post.

Services include:

-   `getPosts` : to get all posts of the organization.
-   `addLike` : to add like to the post.
-   `removeLike` : to remove the like from the post.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]
    -   PostService



## Constructors

[PostService](../services_post_service/PostService/PostService.html)

:   



## Properties

[[after](../services_post_service/PostService/after.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]

:   ::: features
    getter/setter pair
    :::

[[before](../services_post_service/PostService/before.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]

:   ::: features
    getter/setter pair
    :::

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   feed cacheBox key.
    ::: features
    finalinherited
    :::

[[first](../services_post_service/PostService/first.html)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]

:   ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[last](../services_post_service/PostService/last.html)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]

:   ::: features
    getter/setter pair
    :::

[[postInfo](../services_post_service/PostService/postInfo.html)] [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?]

:   ::: features
    getter/setter pair
    :::

[[postStream](../services_post_service/PostService/postStream.html)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]]\>]]
:   Getter for Stream of posts.
    ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[updatedPostStream](../services_post_service/PostService/updatedPostStream.html)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]]
:   Getter for Stream of update in any post.
    ::: features
    no setter
    :::



## Methods

[[addCommentLocally](../services_post_service/PostService/addCommentLocally.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] postID]) → void ]
:   Method to add comment of a user and update comments using updated
    Post Stream.

[[addLike](../services_post_service/PostService/addLike.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] postID]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Method to add like on a Post.

[[addNewpost](../services_post_service/PostService/addNewpost.html)][([[[Post](../models_post_post_model/Post-class.html)] newPost]) → void ]
:   Method to add newly created post at the very top of the feed.

[[deletePost](../services_post_service/PostService/deletePost.html)][([[[Post](../models_post_post_model/Post-class.html)] post]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]

:   

[[fetchDataFromApi](../services_post_service/PostService/fetchDataFromApi.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]]\>]] ]
:   Abstract method to be implemented by subclasses to fetch data from
    an API.
    ::: features
    override
    :::

[[fetchPostsInitial](../services_post_service/PostService/fetchPostsInitial.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]

:   

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]]\>]] ]
:   Fetches new data from the API if online, updates the cache, and
    returns the data.
    ::: features
    inherited
    :::

[[getPosts](../services_post_service/PostService/getPosts.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method used to fetch all posts of the current organisation.

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]]\>]] ]
:   Loads the data cached in Hive.
    ::: features
    inherited
    :::

[[nextPage](../services_post_service/PostService/nextPage.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to handle pagination by fetching next page of posts.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[previousPage](../services_post_service/PostService/previousPage.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to handle pagination by fetching previous page of posts.

[[refreshFeed](../services_post_service/PostService/refreshFeed.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to refresh feed of current selected organisation.

[[removeLike](../services_post_service/PostService/removeLike.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] postID]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Method to remove like in a Post.

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]\>]] data]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Saves a list of data to the cache, replacing any existing data.
    ::: features
    inherited
    :::

[setOrgStreamSubscription](../services_post_service/PostService/setOrgStreamSubscription.html) [→ void ]
:   This method sets up a stream that constantly listens to change in
    current org.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [post_service](../services_post_service/)
3.  PostService class

##### post_service library







