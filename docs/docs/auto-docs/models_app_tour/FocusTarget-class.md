




FocusTarget class - app\_tour library - Dart API







menu

1. [talawa](../index.html)
2. [models/app\_tour.dart](../models_app_tour/models_app_tour-library.html)
3. FocusTarget class

FocusTarget


dark\_mode

light\_mode




# FocusTarget class


Class that represents FocusTarget.


## Constructors

[FocusTarget](../models_app_tour/FocusTarget/FocusTarget.html)({required [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>> key, required String keyName, required String description, required [AppTour](../models_app_tour/AppTour-class.html) appTour, bool isCircle = false, [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html) align = ContentAlign.bottom, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) crossAlign = CrossAxisAlignment.start, [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html) skipAlignment = Alignment.topRight, dynamic next()?, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) nextCrossAlign = CrossAxisAlignment.end, bool isEnd = false})

This returns a widget for a step in a tutorial.



## Properties

[align](../models_app_tour/FocusTarget/align.html)
↔ [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html)

alignment of description text.
getter/setter pair

[appTour](../models_app_tour/FocusTarget/appTour.html)
↔ [AppTour](../models_app_tour/AppTour-class.html)

instance of AppTour.
getter/setter pair

[crossAlign](../models_app_tour/FocusTarget/crossAlign.html)
↔ [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)

crossAxisAlignment.
getter/setter pair

[description](../models_app_tour/FocusTarget/description.html)
↔ String

description of the target.
getter/setter pair

[focusWidget](../models_app_tour/FocusTarget/focusWidget.html)
↔ [TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)

Target focus widget with all above properties.
getter/setter pair

[hashCode](../models_app_tour/FocusTarget/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[isCircle](../models_app_tour/FocusTarget/isCircle.html)
↔ bool

true if focusing shape is circle.
getter/setter pair

[isEnd](../models_app_tour/FocusTarget/isEnd.html)
↔ bool

true current target ends ths appTour.
getter/setter pair

[key](../models_app_tour/FocusTarget/key.html)
↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>

represents the key of the target that is intended to be focused.
getter/setter pair

[keyName](../models_app_tour/FocusTarget/keyName.html)
↔ String

keyName of the target in mainScreenViewModel.
getter/setter pair

[next](../models_app_tour/FocusTarget/next.html)
↔ dynamic Function()?

next callback that is executed on pressing this target.
getter/setter pair

[nextCrossAlign](../models_app_tour/FocusTarget/nextCrossAlign.html)
↔ [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)

next target's crossAxisAlignment.
getter/setter pair

[runtimeType](../models_app_tour/FocusTarget/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[skipAlignment](../models_app_tour/FocusTarget/skipAlignment.html)
↔ [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html)

skip alignment configuration.
getter/setter pair



## Methods

[noSuchMethod](../models_app_tour/FocusTarget/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../models_app_tour/FocusTarget/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../models_app_tour/FocusTarget/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [app\_tour](../models_app_tour/models_app_tour-library.html)
3. FocusTarget class

##### app\_tour library





talawa
1.0.0+1






