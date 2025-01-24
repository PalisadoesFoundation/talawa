




closeBox method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. closeBox<T> static method

closeBox


dark\_mode

light\_mode




# closeBox<T> static method


Future<void>
closeBox<T>(

1. String boxName

)

Closes the `boxName` named box.

**params**:

* `boxName`: Name of the box.

**returns**:
None


## Implementation

```
static Future<void> closeBox<T>(String boxName) async {
  try {
    await Hive.box<T>(boxName).close();
  } catch (e) {
    print('Failed to close the box $boxName');
  }
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. closeBox<T> static method

##### HiveManager class





talawa
1.0.0+1






