




registerAdapters method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. registerAdapters static method

registerAdapters


dark\_mode

light\_mode




# registerAdapters static method


Future<void>
registerAdapters()

Registers the necessary Hive adapters for the models used in the application.

**params**:
None

**returns**:
None


## Implementation

```
static Future<void> registerAdapters() async {
  registerAdapter<User>(UserAdapter());
  registerAdapter<OrgInfo>(OrgInfoAdapter());
  registerAdapter<AsymetricKeys>(AsymetricKeysAdapter());
  registerAdapter<CachedUserAction>(CachedUserActionAdapter());
  registerAdapter<CachedOperationType>(CachedOperationTypeAdapter());
  registerAdapter<CachedUserActionStatus>(CachedUserActionStatusAdapter());
  registerAdapter<Post>(PostAdapter());
  registerAdapter<Event>(EventAdapter());
  registerAdapter<LikedBy>(LikedByAdapter());
  registerAdapter<Attendee>(AttendeeAdapter());
  registerAdapter<Comment>(CommentAdapter());
  registerAdapter<Comments>(CommentsAdapter());
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. registerAdapters static method

##### HiveManager class





talawa
1.0.0+1






