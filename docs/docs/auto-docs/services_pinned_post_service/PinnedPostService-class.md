



menu

1.  [talawa](../index.md)
2.  [services/pinned_post_service.dart](../services_pinned_post_service/)
3.  PinnedPostService class


PinnedPostService


 dark_mode   light_mode 




<div>

# PinnedPostService class

</div>


Service to manage pinned posts in the application.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.md)[\<[[Post](../models_post_post_model/Post-class.md)]\>]
    -   PinnedPostService



## Constructors

[PinnedPostService](../services_pinned_post_service/PinnedPostService/PinnedPostService.md)

:   



## Properties

[[after](../services_pinned_post_service/PinnedPostService/after.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   `after` is used to fetch posts after a certain cursor.
    ::: features
    getter/setter pair
    :::

[[before](../services_pinned_post_service/PinnedPostService/before.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   `before` is used to fetch posts before a certain cursor.
    ::: features
    getter/setter pair
    :::

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   feed cacheBox key.
    ::: features
    finalinherited
    :::

[[currentOrg](../services_pinned_post_service/PinnedPostService/currentOrg.md)] [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)]
:   Returns current organisation.
    ::: features
    no setter
    :::

[[first](../services_pinned_post_service/PinnedPostService/first.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   `first` is used to limit the number of posts fetched in a single
    request.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[last](../services_pinned_post_service/PinnedPostService/last.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
:   `last` is used to limit the number of posts fetched so i dont
    thinkin a single request from the end.
    ::: features
    getter/setter pair
    :::

[[pinnedPostInfo](../services_pinned_post_service/PinnedPostService/pinnedPostInfo.md)] [↔ [PageInfo](../models_page_info_page_info/PageInfo-class.md)]
:   Object to hold pagination information for posts. It contains
    information like `after`, `before`, `first`, and `last`.
    ::: features
    getter/setter pair
    :::

[[pinnedPosts](../services_pinned_post_service/PinnedPostService/pinnedPosts.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]
:   Getter to access the list of pinned posts.
    ::: features
    no setter
    :::

[[pinnedPostStream](../services_pinned_post_service/PinnedPostService/pinnedPostStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]\>]]
:   Returns a stream of pinned posts.
    ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[fetchDataFromApi](../services_pinned_post_service/PinnedPostService/fetchDataFromApi.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]\>]] ]
:   Abstract method to be implemented by subclasses to fetch data from
    an API.
    ::: features
    override
    :::

[[fetchPostsInitial](../services_pinned_post_service/PinnedPostService/fetchPostsInitial.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to load cached data from Hive database.

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]\>]] ]
:   Fetches new data from the API if online, updates the cache, and
    returns the data.
    ::: features
    inherited
    :::

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]\>]] ]
:   Loads the data cached in Hive.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[refreshPinnedPosts](../services_pinned_post_service/PinnedPostService/refreshPinnedPosts.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Fetches pinned posts from API, updates cache and stream.

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Post](../models_post_post_model/Post-class.md)]\>]] data]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Saves a list of data to the cache, replacing any existing data.
    ::: features
    inherited
    :::

[setOrgStreamSubscription](../services_pinned_post_service/PinnedPostService/setOrgStreamSubscription.md) [→ void ]
:   This method sets up a stream that constantly listens to change in
    current org.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [pinned_post_service](../services_pinned_post_service/)
3.  PinnedPostService class

##### pinned_post_service library









 talawa 1.0.0+1 
