




initializeHive method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. initializeHive static method

initializeHive


dark\_mode

light\_mode




# initializeHive static method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initializeHive({

1. required [Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html) dir,

})

Initializes Hive with the specified directory.

**params**:

* `dir`: A [Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html) object representing the directory where Hive will store its data files.

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
2. [hive\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. initializeHive static method

##### HiveManager class





talawa
1.0.0+1






