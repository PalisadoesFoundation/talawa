




shouldRepaint method - LanguageIcon class - language\_icon library - Dart API







menu

1. [talawa](../../index.html)
2. [custom\_painters/language\_icon.dart](../../custom_painters_language_icon/custom_painters_language_icon-library.html)
3. [LanguageIcon](../../custom_painters_language_icon/LanguageIcon-class.html)
4. shouldRepaint method

shouldRepaint


dark\_mode

light\_mode




# shouldRepaint method


1. @override

bool
shouldRepaint(

1. covariant [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html) oldDelegate

)
override

Called whenever a new instance of the custom painter delegate class is
provided to the [RenderCustomPaint](https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html) object, or any time that a new
[CustomPaint](https://api.flutter.dev/flutter/widgets/CustomPaint-class.html) object is created with a new instance of the custom painter
delegate class (which amounts to the same thing, because the latter is
implemented in terms of the former).

If the new instance represents different information than the old
instance, then the method should return true, otherwise it should return
false.

If the method returns false, then the [paint](../../custom_painters_language_icon/LanguageIcon/paint.html) call might be optimized
away.

It's possible that the [paint](../../custom_painters_language_icon/LanguageIcon/paint.html) method will get called even if
[shouldRepaint](../../custom_painters_language_icon/LanguageIcon/shouldRepaint.html) returns false (e.g. if an ancestor or descendant needed to
be repainted). It's also possible that the [paint](../../custom_painters_language_icon/LanguageIcon/paint.html) method will get called
without [shouldRepaint](../../custom_painters_language_icon/LanguageIcon/shouldRepaint.html) being called at all (e.g. if the box changes
size).

If a custom delegate has a particularly expensive paint function such that
repaints should be avoided as much as possible, a [RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html) or
[RenderRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderRepaintBoundary-class.html) (or other render object with
[RenderObject.isRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderObject/isRepaintBoundary.html) set to true) might be helpful.

The `oldDelegate` argument will never be null.


## Implementation

```
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
}
```

 


1. [talawa](../../index.html)
2. [language\_icon](../../custom_painters_language_icon/custom_painters_language_icon-library.html)
3. [LanguageIcon](../../custom_painters_language_icon/LanguageIcon-class.html)
4. shouldRepaint method

##### LanguageIcon class





talawa
1.0.0+1






