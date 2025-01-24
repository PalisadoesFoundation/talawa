




initializeHive method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. initializeHive static method

initializeHive


dark\_mode

light\_mode




# initializeHive static method


Future<void>
initializeHive({

1. required Directory dir,

})

Initializes Hive with the specified directory.

**params**:

* `dir`: A `Directory` object representing the directory where Hive will store its data files.

**returns**:
None


## Implementation

```
static Future<void> initializeHive({required Directory dir}) async {
  _initHive(dir);
  await registerAdapters();
  await _openBoxes();
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. initializeHive static method

##### HiveManager class





talawa
1.0.0+1






