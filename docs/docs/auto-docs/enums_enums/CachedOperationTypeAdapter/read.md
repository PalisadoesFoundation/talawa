
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[CachedOperationType](../../enums_enums/CachedOperationType.md)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.md)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
CachedOperationType read(BinaryReader reader) {
  switch (reader.) {
    case 0:
      return CachedOperationType.gqlAuthQuery;
    case 1:
      return CachedOperationType.gqlAuthMutation;
    case 2:
      return CachedOperationType.gqlNonAuthQuery;
    case 3:
      return CachedOperationType.gqlNonAuthMutation;
    default:
      return CachedOperationType.gqlAuthQuery;
  }
}
```







1.  [talawa](../../index.md)
2.  [enums](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.md)
4.  read method

##### CachedOperationTypeAdapter class







