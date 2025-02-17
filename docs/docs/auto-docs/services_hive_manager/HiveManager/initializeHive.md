
<div>

# initializeHive static method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
initializeHive({

1.  [required
    [[Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.md)]
    dir, ]

})



Initializes Hive with the specified directory.

**params**:

-   `dir`: A
    [Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html)
    object representing the directory where Hive will store its data
    files.

**returns**: None



## Implementation

``` language-dart
static Future<void> initializeHive({required Directory dir}) async {
  _initHive(dir);
  await ;
  await ;
}
```







1.  [talawa](../../index.md)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.md)
4.  initializeHive static method

##### HiveManager class







