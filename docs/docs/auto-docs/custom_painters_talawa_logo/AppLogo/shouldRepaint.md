
<div>

# shouldRepaint method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
shouldRepaint(

1.  [covariant
    [[CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.md)]
    oldDelegate]

)


override




Called whenever a new instance of the custom painter delegate class is
provided to the
[RenderCustomPaint](https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html)
object, or any time that a new
[CustomPaint](https://api.flutter.dev/flutter/widgets/CustomPaint-class.html)
object is created with a new instance of the custom painter delegate
class (which amounts to the same thing, because the latter is
implemented in terms of the former).

If the new instance represents different information than the old
instance, then the method should return true, otherwise it should return
false.

If the method returns false, then the
[paint](../../custom_painters_talawa_logo/AppLogo/paint.md) call might
be optimized away.

It\'s possible that the
[paint](../../custom_painters_talawa_logo/AppLogo/paint.md) method
will get called even if
[shouldRepaint](../../custom_painters_talawa_logo/AppLogo/shouldRepaint.md)
returns false (e.g. if an ancestor or descendant needed to be
repainted). It\'s also possible that the
[paint](../../custom_painters_talawa_logo/AppLogo/paint.md) method
will get called without
[shouldRepaint](../../custom_painters_talawa_logo/AppLogo/shouldRepaint.md)
being called at all (e.g. if the box changes size).

If a custom delegate has a particularly expensive paint function such
that repaints should be avoided as much as possible, a
[RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html)
or
[RenderRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderRepaintBoundary-class.html)
(or other render object with
[RenderObject.isRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderObject/isRepaintBoundary.md)
set to true) might be helpful.

The `oldDelegate` argument will never be null.



## Implementation

``` language-dart
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) 
```







1.  [talawa](../../index.md)
2.  [talawa_logo](../../custom_painters_talawa_logo/)
3.  [AppLogo](../../custom_painters_talawa_logo/AppLogo-class.md)
4.  shouldRepaint method

##### AppLogo class







