
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]
    writer, ]
2.  [[[CachedOperationType](../../enums_enums/CachedOperationType.html)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
@override
void write(BinaryWriter writer, CachedOperationType obj) {
  switch (obj) {
    case CachedOperationType.gqlAuthQuery:
      writer.writeByte(0);
      break;
    case CachedOperationType.gqlAuthMutation:
      writer.writeByte(1);
      break;
    case CachedOperationType.gqlNonAuthQuery:
      writer.writeByte(2);
      break;
    case CachedOperationType.gqlNonAuthMutation:
      writer.writeByte(3);
      break;
  }
}
```







1.  [talawa](../../index.html)
2.  [enums](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4.  write method

##### CachedOperationTypeAdapter class







