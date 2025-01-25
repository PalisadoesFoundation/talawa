




registerAdapter method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. registerAdapter<T> static method

registerAdapter


dark\_mode

light\_mode




# registerAdapter<T> static method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
registerAdapter<T>(

1. dynamic adapter

)

Registers the `adapter` named adapter.

**params**:

* `adapter`: Adapter to register.

**returns**:
None


## Implementation

```
static Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async {
  try {
    Hive.registerAdapter<T>(adapter);
  } catch (e) {
    print('Failed to register Hive adapters: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [hive\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. [HiveManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager-class.html)
4. registerAdapter<T> static method

##### HiveManager class





talawa
1.0.0+1






