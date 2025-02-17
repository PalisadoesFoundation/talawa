
<div>

# registerAdapter\<[T\>] static method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
registerAdapter\<T\>(

1.  [[[TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.html)\<[T\>]]
    adapter]

)



Registers the `adapter` named adapter.

**params**:

-   `adapter`: Adapter to register.

**returns**: None



## Implementation

``` language-dart
static Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async {
  try {
    Hive.registerAdapter<T>(adapter);
  } catch (e) {
    print('Failed to register Hive adapters: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapter\<T\> static method

##### HiveManager class







