::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [widgets/custom_list_tile.dart](../widgets_custom_list_tile/)
3.  CustomListTile class

::: self-name
CustomListTile
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_custom_list_tile/widgets_custom_list_tile-library-sidebar.html" below-sidebar="widgets_custom_list_tile/CustomListTile-class-sidebar.html"}
<div>

# [CustomListTile]{.kind-class} class

</div>

::: {.section .desc .markdown}
Returns a widget for rendering Customized tiles.

A Tile shows the org info, user info, options that on tap user & org
info.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   CustomListTile

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CustomListTile](../widgets_custom_list_tile/CustomListTile/CustomListTile.html)]{.name}[({[required [[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)]{.type-annotation} [key]{.parameter-name}, ]{#-param-key .parameter}[required [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [index]{.parameter-name}, ]{#-param-index .parameter}[required [[TileType](../enums_enums/TileType.html)]{.type-annotation} [type]{.parameter-name}, ]{#-param-type .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [showIcon]{.parameter-name} = [false]{.default-value}, ]{#-param-showIcon .parameter}[[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation} [orgInfo]{.parameter-name}, ]{#-param-orgInfo .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [userInfo]{.parameter-name}, ]{#-param-userInfo .parameter}[[[Attendee](../models_events_event_model/Attendee-class.html)?]{.type-annotation} [attendeeInfo]{.parameter-name}, ]{#-param-attendeeInfo .parameter}[[[Options](../models_options_options/Options-class.html)?]{.type-annotation} [option]{.parameter-name}, ]{#-param-option .parameter}[[dynamic]{.type-annotation} [onTapOrgInfo]{.parameter-name}([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}]{#param- .parameter})?, ]{#-param-onTapOrgInfo .parameter}[[dynamic]{.type-annotation} [onTapUserInfo]{.parameter-name}()?, ]{#-param-onTapUserInfo .parameter}[[dynamic]{.type-annotation} [onTapAttendeeInfo]{.parameter-name}()?, ]{#-param-onTapAttendeeInfo .parameter}[[dynamic]{.type-annotation} [onTapOption]{.parameter-name}()?]{#-param-onTapOption .parameter}})]{.signature}

:   ::: {.constructor-modifier .features}
    const
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[attendeeInfo](../widgets_custom_list_tile/CustomListTile/attendeeInfo.html)]{.name} [→ [Attendee](../models_events_event_model/Attendee-class.html)?]{.signature}
:   Object containing all the necessary info regarding the Attendee.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[index](../widgets_custom_list_tile/CustomListTile/index.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   Index int of tiles.
    ::: features
    [final]{.feature}
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)]{.name} [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.signature}
:   Controls how one widget replaces another widget in the tree.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[onTapAttendeeInfo](../widgets_custom_list_tile/CustomListTile/onTapAttendeeInfo.html)]{.name} [→ dynamic Function[()]{.signature}?]{.signature}
:   Function to handle the tap on attendee info.
    ::: features
    [final]{.feature}
    :::

[[onTapOption](../widgets_custom_list_tile/CustomListTile/onTapOption.html)]{.name} [→ dynamic Function[()]{.signature}?]{.signature}
:   Object containing all the necessary info regarding the onTapOption.
    ::: features
    [final]{.feature}
    :::

[[onTapOrgInfo](../widgets_custom_list_tile/CustomListTile/onTapOrgInfo.html)]{.name} [→ dynamic Function[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}]{#param- .parameter})]{.signature}?]{.signature}
:   Function to handle the tap on org info.
    ::: features
    [final]{.feature}
    :::

[[onTapUserInfo](../widgets_custom_list_tile/CustomListTile/onTapUserInfo.html)]{.name} [→ dynamic Function[()]{.signature}?]{.signature}
:   Function to handle the tap on user info.
    ::: features
    [final]{.feature}
    :::

[[option](../widgets_custom_list_tile/CustomListTile/option.html)]{.name} [→ [Options](../models_options_options/Options-class.html)?]{.signature}
:   Object containing all the necessary info regarding the options.
    ::: features
    [final]{.feature}
    :::

[[orgInfo](../widgets_custom_list_tile/CustomListTile/orgInfo.html)]{.name} [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   Object containing all the necessary info regarding the org.
    ::: features
    [final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[showIcon](../widgets_custom_list_tile/CustomListTile/showIcon.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Flag to determine whether thge Icons should be shown.
    ::: features
    [final]{.feature}
    :::

[[type](../widgets_custom_list_tile/CustomListTile/type.html)]{.name} [→ [TileType](../enums_enums/TileType.html)]{.signature}
:   Tiletype object to specify tle type.
    ::: features
    [final]{.feature}
    :::

[[userInfo](../widgets_custom_list_tile/CustomListTile/userInfo.html)]{.name} [→ [User](../models_user_user_info/User-class.html)?]{.signature}
:   Object containing all the necessary info regarding the user.
    ::: features
    [final]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)]{.name}[({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.type-annotation} [key]{.parameter-name}, ]{#animate-param-key .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Effect](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Effect-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [effects]{.parameter-name}, ]{#animate-param-effects .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onInit]{.parameter-name}, ]{#animate-param-onInit .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onPlay]{.parameter-name}, ]{#animate-param-onPlay .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onComplete]{.parameter-name}, ]{#animate-param-onComplete .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [autoPlay]{.parameter-name}, ]{#animate-param-autoPlay .parameter}[[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)?]{.type-annotation} [delay]{.parameter-name}, ]{#animate-param-delay .parameter}[[[AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)?]{.type-annotation} [controller]{.parameter-name}, ]{#animate-param-controller .parameter}[[[Adapter](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Adapter-class.html)?]{.type-annotation} [adapter]{.parameter-name}, ]{#animate-param-adapter .parameter}[[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]{.type-annotation} [target]{.parameter-name}, ]{#animate-param-target .parameter}[[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]{.type-annotation} [value]{.parameter-name}]{#animate-param-value .parameter}}) [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)]{.returntype .parameter} ]{.signature}

:   Available on
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html),
    provided by the
    [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
    extension

    Wraps the target
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    in an
    [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)
    instance, and returns the instance for chaining calls. Ex.
    `myWidget.animate()` is equivalent to `Animate(child: myWidget)`.

[[build](../widgets_custom_list_tile/CustomListTile/build.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#build-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   Describes the part of the user interface represented by this widget.
    ::: features
    [override]{.feature}
    :::

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)]{.name}[() [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    [inherited]{.feature}
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)]{.name}[() [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Returns a list of
    [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)
    objects describing this node\'s children.
    ::: features
    [inherited]{.feature}
    :::

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)]{.name}[([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html)]{.type-annotation} [properties]{.parameter-name}]{#debugFillProperties-param-properties .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Add additional properties associated with the node.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [name]{.parameter-name}, ]{#toDiagnosticsNode-param-name .parameter}[[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?]{.type-annotation} [style]{.parameter-name}]{#toDiagnosticsNode-param-style .parameter}}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)]{.name}[({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.info]{.default-value}]{#toString-param-minLevel .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [prefixLineOne]{.parameter-name} = [\'\']{.default-value}, ]{#toStringDeep-param-prefixLineOne .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [prefixOtherLines]{.parameter-name}, ]{#toStringDeep-param-prefixOtherLines .parameter}[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.debug]{.default-value}, ]{#toStringDeep-param-minLevel .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [wrapWidth]{.parameter-name} = [65]{.default-value}]{#toStringDeep-param-wrapWidth .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a string representation of this node and its descendants.
    ::: features
    [inherited]{.feature}
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [joiner]{.parameter-name} = [\', \']{.default-value}, ]{#toStringShallow-param-joiner .parameter}[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.debug]{.default-value}]{#toStringShallow-param-minLevel .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a one-line detailed description of the object.
    ::: features
    [inherited]{.feature}
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A short, textual description of this widget.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
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
2.  [custom_list_tile](../widgets_custom_list_tile/)
3.  CustomListTile class

##### custom_list_tile library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
