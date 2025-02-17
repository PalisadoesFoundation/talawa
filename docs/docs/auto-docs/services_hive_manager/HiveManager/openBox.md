
<div>

# openBox\<[T\>] static method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
openBox\<T\>(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    boxName]

)



Opens the `boxName` named box.

**params**:

-   `boxName`: Name of the box.

**returns**: None



## Implementation

``` language-dart
static Future<void> openBox<T>(String boxName) async {
  try {
    await Hive.openBox<T>(boxName);
  } catch (e) {
    print('Failed to open box $boxName');
  }
}
```







1.  [talawa](../../index.md)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.md)
4.  openBox\<T\> static method

##### HiveManager class







