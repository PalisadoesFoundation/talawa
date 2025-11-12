



menu

1.  [talawa](../../index.md)
2.  [services/caching/base_feed_manager.dart](../../services_caching_base_feed_manager/)
3.  BaseFeedManager[\<[T\>]](../../services_caching_base_feed_manager/BaseFeedManager-class.md)
4.  getNewFeedAndRefreshCache method


getNewFeedAndRefreshCache


 dark_mode   light_mode 




<div>

# getNewFeedAndRefreshCache method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)\<[T\>]]\>]]




Fetches new data from the API if online, updates the cache, and returns
the data.

If offline, loads and returns cached data.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of the latest data.



## Implementation

``` language-dart
Future<List<T>>  async 
```







1.  [talawa](../../index.md)
2.  [base_feed_manager](../../services_caching_base_feed_manager/)
3.  BaseFeedManager[\<[T\>]](../../services_caching_base_feed_manager/BaseFeedManager-class.md)
4.  getNewFeedAndRefreshCache method

##### BaseFeedManager class









 talawa 1.0.0+1 
