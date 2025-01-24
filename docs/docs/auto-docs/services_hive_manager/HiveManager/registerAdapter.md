




registerAdapter method - HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/hive\_manager.dart](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. registerAdapter<T> static method

registerAdapter


dark\_mode

light\_mode




# registerAdapter<T> static method


Future<void>
registerAdapter<T>(

1. [TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.html)<T> adapter

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
2. [hive\_manager](../../services_hive_manager/services_hive_manager-library.html)
3. [HiveManager](../../services_hive_manager/HiveManager-class.html)
4. registerAdapter<T> static method

##### HiveManager class





talawa
1.0.0+1






