



menu

1.  [talawa](../../index.md)
2.  [utils/pair.dart](../../utils_pair/)
3.  Pair[\<[T,
    U\>]](../../utils_pair/Pair-class.md)
4.  toString method


toString


 dark_mode   light_mode 




<div>

# toString method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]



override




A string representation of this object.

Some classes have a default textual representation, often paired with a
static `parse` function (like
[int.parse](https://api.flutter.dev/flutter/dart-core/int/parse.md)).
These classes will provide the textual representation as their string
representation.

Other classes have no meaningful textual representation that a program
will care about. Such classes will typically override `toString` to
provide useful information when inspecting the object, mainly for
debugging or logging.



## Implementation

``` language-dart
@override
String  => '($first, $second)';
```







1.  [talawa](../../index.md)
2.  [pair](../../utils_pair/)
3.  Pair[\<[T,
    U\>]](../../utils_pair/Pair-class.md)
4.  toString method

##### Pair class









 talawa 1.0.0+1 
