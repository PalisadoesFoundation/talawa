
<div>

# openQueue method

</div>


void 



Opens the Hive box for the offline action queue.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  _actionsBox = Hive.box<CachedUserAction>(boxName);
}
```







1.  [talawa](../../index.html)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  openQueue method

##### OfflineActionQueue class







