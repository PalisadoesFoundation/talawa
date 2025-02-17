
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.md)]
    writer, ]
2.  [[[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.md)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
@override
void write(BinaryWriter writer, CachedUserActionStatus obj) {
  switch (obj) {
    case CachedUserActionStatus.pending:
      writer.writeByte(0);
      break;
    case CachedUserActionStatus.completed:
      writer.writeByte(1);
      break;
  }
}
```







1.  [talawa](../../index.md)
2.  [enums](../../enums_enums/)
3.  [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.md)
4.  write method

##### CachedUserActionStatusAdapter class







