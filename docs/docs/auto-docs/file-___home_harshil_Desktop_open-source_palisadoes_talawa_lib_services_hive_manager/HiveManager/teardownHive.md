




teardownHive method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. teardownHive static method

teardownHive


dark\_mode

light\_mode




# teardownHive static method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
teardownHive()

Closes all opened Hive boxes and the Hive instance itself.

This method ensures that all Hive boxes are properly closed to avoid potential data corruption
when the application is terminated or when Hive is no longer needed.

**params**:
None

**returns**:
None


## Implementation

```
static Future<void> teardownHive() async {
  await _closeBoxes();
  await Hive.close();
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. teardownHive static method

##### HiveManager class





talawa
1.0.0+1






