
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
CachedUserActionStatus read(BinaryReader reader) {
  switch (reader.) {
    case 0:
      return CachedUserActionStatus.pending;
    case 1:
      return CachedUserActionStatus.completed;
    default:
      return CachedUserActionStatus.pending;
  }
}
```







1.  [talawa](../../index.html)
2.  [enums](../../enums_enums/)
3.  [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4.  read method

##### CachedUserActionStatusAdapter class







