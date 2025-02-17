
<div>

# registerAdapters static method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Registers the necessary Hive adapters for the models used in the
application.

**params**: None

**returns**: None



## Implementation

``` language-dart
static Future<void>  async {
  registerAdapter<User>();
  registerAdapter<OrgInfo>();
  registerAdapter<AsymetricKeys>();
  registerAdapter<CachedUserAction>();
  registerAdapter<CachedOperationType>();
  registerAdapter<CachedUserActionStatus>();
  registerAdapter<Post>();
  registerAdapter<Event>();
  registerAdapter<LikedBy>();
  registerAdapter<Attendee>();
  registerAdapter<Comment>();
  registerAdapter<Comments>();
}
```







1.  [talawa](../../index.html)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapters static method

##### HiveManager class







