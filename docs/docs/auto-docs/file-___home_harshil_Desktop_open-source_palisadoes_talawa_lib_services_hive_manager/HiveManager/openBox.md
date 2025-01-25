




openBox method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. openBox<T> static method

openBox


dark\_mode

light\_mode




# openBox<T> static method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
openBox<T>(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) boxName

)

Opens the `boxName` named box.

**params**:

* `boxName`: Name of the box.

**returns**:
None


## Implementation

```
static Future<void> openBox<T>(String boxName) async {
  try {
    await Hive.openBox<T>(boxName);
  } catch (e) {
    print('Failed to open box $boxName');
  }
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. openBox<T> static method

##### HiveManager class





talawa
1.0.0+1






