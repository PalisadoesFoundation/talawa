::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [models/app_tour.dart](../models_app_tour/)
3.  FocusTarget class

::: self-name
FocusTarget
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_app_tour/models_app_tour-library-sidebar.html" below-sidebar="models_app_tour/FocusTarget-class-sidebar.html"}
<div>

# [FocusTarget]{.kind-class} class

</div>

::: {.section .desc .markdown}
Class that represents FocusTarget.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[FocusTarget](../models_app_tour/FocusTarget/FocusTarget.html)]{.name}[({[required [[GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.type-annotation} [key]{.parameter-name}, ]{#-param-key .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [keyName]{.parameter-name}, ]{#-param-keyName .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [description]{.parameter-name}, ]{#-param-description .parameter}[required [[AppTour](../models_app_tour/AppTour-class.html)]{.type-annotation} [appTour]{.parameter-name}, ]{#-param-appTour .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isCircle]{.parameter-name} = [false]{.default-value}, ]{#-param-isCircle .parameter}[[[ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html)]{.type-annotation} [align]{.parameter-name} = [ContentAlign.bottom]{.default-value}, ]{#-param-align .parameter}[[[CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.type-annotation} [crossAlign]{.parameter-name} = [CrossAxisAlignment.start]{.default-value}, ]{#-param-crossAlign .parameter}[[[Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html)]{.type-annotation} [skipAlignment]{.parameter-name} = [Alignment.topRight]{.default-value}, ]{#-param-skipAlignment .parameter}[[dynamic]{.type-annotation} [next]{.parameter-name}()?, ]{#-param-next .parameter}[[[CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.type-annotation} [nextCrossAlign]{.parameter-name} = [CrossAxisAlignment.end]{.default-value}, ]{#-param-nextCrossAlign .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isEnd]{.parameter-name} = [false]{.default-value}]{#-param-isEnd .parameter}})]{.signature}
:   This returns a widget for a step in a tutorial.
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[align](../models_app_tour/FocusTarget/align.html)]{.name} [↔ [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html)]{.signature}
:   alignment of description text.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[appTour](../models_app_tour/FocusTarget/appTour.html)]{.name} [↔ [AppTour](../models_app_tour/AppTour-class.html)]{.signature}
:   instance of AppTour.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[crossAlign](../models_app_tour/FocusTarget/crossAlign.html)]{.name} [↔ [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.signature}
:   crossAxisAlignment.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[description](../models_app_tour/FocusTarget/description.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   description of the target.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[focusWidget](../models_app_tour/FocusTarget/focusWidget.html)]{.name} [↔ [TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]{.signature}
:   Target focus widget with all above properties.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isCircle](../models_app_tour/FocusTarget/isCircle.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   true if focusing shape is circle.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isEnd](../models_app_tour/FocusTarget/isEnd.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   true current target ends ths appTour.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[key](../models_app_tour/FocusTarget/key.html)]{.name} [↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   represents the key of the target that is intended to be focused.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[keyName](../models_app_tour/FocusTarget/keyName.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   keyName of the target in mainScreenViewModel.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[next](../models_app_tour/FocusTarget/next.html)]{.name} [↔ dynamic Function[()]{.signature}?]{.signature}
:   next callback that is executed on pressing this target.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[nextCrossAlign](../models_app_tour/FocusTarget/nextCrossAlign.html)]{.name} [↔ [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.signature}
:   next target\'s crossAxisAlignment.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[skipAlignment](../models_app_tour/FocusTarget/skipAlignment.html)]{.name} [↔ [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html)]{.signature}
:   skip alignment configuration.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor .inherited}
## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [app_tour](../models_app_tour/)
3.  FocusTarget class

##### app_tour library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
