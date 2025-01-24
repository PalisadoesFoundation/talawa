




teardownHive method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. teardownHive static method

teardownHive


dark\_mode

light\_mode




# teardownHive static method


Future<void>
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
2. [hive\_manager](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. teardownHive static method

##### HiveManager class





talawa
1.0.0+1






