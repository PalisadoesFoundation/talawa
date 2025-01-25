




openQueue method - OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/offline\_action\_queue.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. openQueue method

openQueue


dark\_mode

light\_mode




# openQueue method


void
openQueue()

Opens the Hive box for the offline action queue.

**params**:
None

**returns**:
None


## Implementation

```
void openQueue() {
  _actionsBox = Hive.box<CachedUserAction>(boxName);
}
```

 


1. [talawa](../../index.html)
2. [offline\_action\_queue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. [OfflineActionQueue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue-class.html)
4. openQueue method

##### OfflineActionQueue class





talawa
1.0.0+1






